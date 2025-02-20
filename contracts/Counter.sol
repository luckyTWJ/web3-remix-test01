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

    constructor(address _ref) {
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

    //引用类型  包括数组 结构体
    // memory（内存） 变量在运行时存在，生命周期只存在函数调用期间   -> 开销最大  gas
    // storage（存储）保存状态变量  合约存在保存在区块链中
    // calldata（调用数据）存储函数参数的特殊数据位置 用来接收外部数据，是一个不可修改的，非持久的函数参数存储区域  ->临时变量，函数掉i用后释放 开销很小

    //在不同引用类型进行赋值时，只有在不同的数据位置赋值时会进行一份拷贝，而在同一个数据位置内通常是增加一个引用  ->最便宜

    uint256[] x; // 状态变量x的数据存储位置是storage

    function f(uint256[] memory memoryArray) public {
        x = memoryArray; // 数组copy到storage中， 因为memory变量赋值给storage
        uint256[] storage y = x; //仅分配一个指针
    }
}
