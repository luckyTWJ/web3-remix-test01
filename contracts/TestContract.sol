// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0;

contract TestContract {
    uint256 public x;
    Hello public h;

    function createHello() public returns (address) {
        h = new Hello();
        return address(h);
    }

    // 判断是合约地址还是外部地址
    //EVM提供了一个操作码EXTCODESIZE，用来获取地址相关联的代码大小（长度），如果是外部账号地址，则没有代码返回
    function isContract(address addr) internal view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(addr)
        }
        return size > 0;
    }

    //获得创建合约的字节码
    // function getContractCreatCode() public view returns (memory) {
    //     return type(this).creationCode;
    // }
}

// 调用 TestContract 合约的 createHello 函数可以创建一个合约（new Hello()）。
contract Hello {
    function sayHi() public pure returns (uint256) {
        return 10;
    }
}
