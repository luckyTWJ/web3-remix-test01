// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0;

//映射是一种使用非常广泛的类型，经常在合约中充当一个类似数据库的角色
contract Testmapping {
    //比如在代币合约中用映射来存储账户的余额，在游戏合约里可以用映射来存储每个账号的级别
    // 映射的定义为mapping(KeyType => ValueType)， KeyType 表示键的类型，ValueType 表示值的类型。
    mapping(address => uint256) public balances; //默认storage

    // mapping(address => uint256) public userLevel;

    //映射变量只能保存在存储中（storage），通常作为状态变量
    function init(uint256 newBalance) public {
        // mapping (address=>uint) memory balances;  //不可以为memory
    }

    function updateBalance(uint256 newBalance) public {
        balances[msg.sender] = newBalance;
    }

    function getBalance(address key) public view returns (uint256) {
        return balances[key];
    }

    //映射是可以嵌套的
    mapping(address => mapping(address => uint256)) tokenBalances;

    struct Data {
        uint256 a;
        bytes3 b;
        mapping(uint256 => uint256) map;
    }

    mapping(uint256 => mapping(bool => Data[])) public data;

    // function data(
    //     uint256 arg1,
    //     bool arg2,
    //     uint256 arg3
    // ) external returns (uint256 a, bytes3 b) {
    //     a = data[arg1][arg2][arg3].a;
    //     b = data[arg1][arg2][arg3].b;
    // }
}
