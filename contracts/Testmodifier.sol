// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0;

contract Testmodifier {

    address owner;
    function ownd() public {
        owner = msg.sender;
    }

    modifier onlyOwnd {
        require(msg.sender == owner,"Only owner can call this function.");
        //函数修改器的工作原理:
        // 函数修改器一般是带有一个特殊符号 _; ； 修改器所修饰的函数的函数体会被插入到_;的位置。
         _;
    }
    function transferOwner(address newO) public onlyOwnd{
        owner  = newO;
    }


    modifier over22(uint age){
        //marry()函数只有满足age >= 22才可以成功调用
        require(age>=22,"too small age");
        _;
    }

    //marry()函数只有满足age >= 22才可以成功调用
    function merry(uint age) public over22(age){

    }

}


