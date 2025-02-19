// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0;

contract Counter {
    //变量类型 可见性（internal） 变量名
    uint256 public counter;

    uint256 constant const = 11 * 11 + 8;
    string constant const_str = "twnj";
    //constant 目前仅支持修饰 strings及值类型
    bytes32 constant myHash = keccak256("abc");

    //不可变量 赋值后无法更改，  在构造函数中赋值，构造函数在部署的时候执行
    //类似的还有保存创建者地址、关联合约地址等  在创建合约的时候指定它的值
    uint256 immutable maxBalance;

    // uint immutable de;

    constructor( address _ref) {
        maxBalance = _ref.balance;
        counter = 0;
    }

    function count() public {
        counter = counter + 1;
    }

    //函数名(<参数类型> <参数名>) <可见性> <状态可变性> [returns(<返回类型>)]
    function get() public view returns (uint256) {
        return counter;
    }

    //支持多个返回值
    // function f()
    //     public
    //     pure
    //     returns (
    //         uint256,
    //         uint256,
    //         string
    //     )
    // {
    //     return (counter, const, const_str);
    // }

    // function g() public {
    //     //获取返回值
    //     (uint256 x, uint256 y, string str) = f();
    // }

    // external 只能在外部调用 称为外部函数
    function add(uint256 x) external {
        counter = counter + x;
    }

    function increase() public {
        // 外部函数 使用this
        this.add(1);
    }
}
