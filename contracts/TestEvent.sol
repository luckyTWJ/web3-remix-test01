// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0;

contract TestEvent {
    constructor() public {

    }
    //   event Deposit(address _from, uint _value);  // 定义事件
      event Deposit(address indexed _from, uint _value);  // 定义事件
      function deposit( uint _value)public {
        emit Deposit(msg.sender, _value);
      }
}