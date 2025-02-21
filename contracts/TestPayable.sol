// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0;

//这个合约仅验证接收以太币，他们没有转出的逻辑，因此，所有发送给它的以太币，都没有办法取回
contract TestPayable {
    event Received(address, uint256);

//     payable 修饰符表示该函数可以接收 ETH
// receive 函数是在合约可以接收 ETH 调用的函数。
// fallback 函数是在匹配不到对应的函数（receive 函数或其他函数找不到）时被调用的函数。

    //函数名只有一个receive关键字，而不需要function关键字，也没有参数和返回值，并且必须是 external可见性和payable修饰
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    //在solidity 0.6里，回退函数是一个无名函数（没有函数名的函数），如果你看到一些老合约代码出现没有名字的函数，不用感到奇怪，它就是回退函数
    //一个合约最多有一个fallback函数，这个函数无参数，也无返回值，也没有function关键字, 必须是external可见性。
    fallback() external payable {}
}

contract Test { 
    // 发送到这个合约的所有消息都会调用此函数（因为该合约没有其它函数）
    // 向这个合约发送以太币会导致异常，因为fallback函数没有 payable 修饰符
    fallback() external {
        x = 1;
    }

    uint256 x;
}

contract TestPayable2 {
    uint256 x;
    uint256 y;

    fallback() external payable {
        x = 1;
        y = msg.value;
    }

    receive() external payable {
        x = 2;
        y = msg.value;
    }
}

contract Caller {
    function callTest(Test test) public returns (bool) {
        (bool success, ) = address(test).call(
            abi.encodeWithSignature("nonExistingFunction()")
        );
        require(success);
        //  test.x结果变成 == 1
        // address(test)不允许直接调用send, 因为test没有payable回退函数
        //  转化为address payable类型 , 然后才可以调用send
        address payable testPayable = payable(address(test));
        // 以下这句将不会编译，但如果有人向该合约发送以太币，交易将失败并拒绝以太币
        // test.send(2 ether）;
    }

    function callTestPayable(TestPayable2 test) public returns (bool) {
        (bool success, ) = address(test).call(
            abi.encodeWithSignature("nonExistingFunction()")
        );
        require(success);
        // test.x结果为 1，test.y结果为0
        (success, ) = address(test).call{value: 1}(
            abi.encodeWithSignature("nonExistingFunction()")
        );
        require(success);
        // test.x结果为1，test.y结果为1
        // 发送以太币，TestPayable的receive函数被调用
        //require(address(test).send(2 ether));
        // test.x结果为2，test.y结果为2 ether
    }
}


contract Bank {
    mapping(address => uint) public deposits;
    
    function deposit() public payable {
        deposits[msg.sender] += msg.value;
    }
    
    
    // 从合约取款
    function withdraw() public {
        uint d = deposits[msg.sender];
        deposits[msg.sender] = 0;

        (bool success, ) = msg.sender.call{value:  d}("");
        require(success, "Failed to send Ether");
    }
}