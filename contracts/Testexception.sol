// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0;

contract TestException {
    // require函数有两个形式：

    // require(bool condition)：如果条件不满足，则撤销状态更改；
    // require(bool condition, string memory message)：如果条件不满足，则撤销状态更改，可以提供一个错误消息。

    function vote(uint256 age) public {
        //（表示在18岁以上才可以投票），否则撤销交易。
        require(age >= 18, "only >= 18 can vote");
    }

    bool public inited;

    function checkInited() internal {
        // inited 应该永远为false
        assert(!inited);
        // 其他的逻辑...
        // 访问数组的索引太大或为负数（例如x[i]其中的i >= x.length或i < 0）。
        // 访问固定长度bytesN的索引太大或为负数。
        // 用零当除数做除法或模运算（例如 5 / 0 或 23 % 0 ）。
        // 移位负数位。
        // 将一个太大或负数值转换为一个枚举类型。
        // 调用未初始化的内部函数类型变量。
    }
}
