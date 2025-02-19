// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0;

contract TestInt {
    int8 a = -1;
    int16 b = 2;
    uint32 c = 10;
    uint8 d = 16;

    function add(uint256 x, uint256 y) public pure returns (uint256 z) {
        uint256 c = x + y;
        require(c >= x); //做溢出判断 加法的结果肯定比任何一个元素大
        return c;
        // z = x + y;
    }

    function divide(uint256 x, uint256 y) public pure returns (uint256 z) {
        z = x / y;
    }

    function leftshift(int256 x, uint256 y) public pure returns (int256 z) {
        z = x << y;
    }

    function rightshift(int256 x, uint256 y) public pure returns (int256 z) {
        z = x >> y;
    }

    function testPlusPlus() public pure returns (uint256) {
        uint256 x = 1;
        uint256 y = ++x;
        return y;
    }

    //  function testMul1()public pure returns(uint8){
    //     unchecked{
    //         uint8 x = 128;
    //         uint8 y = x*2;
    //         return y;
    //     }
    // }

    function testMul1() public pure returns (uint8) {
        uint8 x = 128;
        uint8 y = x * 2;
        return y;
    }

    //   地址类型   账户与地址
    // 地址类型有2种
    // address 保存一个20字节的值（以太坊地址的大小）
    //address payable:表示可支付 的地址（可以接受以太币的地址），格式上与address完全相同 也是20字节

    // address payable拥有2个成员函数 transfer  send  向该地址转账时使用

    address public user;

    function getUserAddress() public {
        user = msg.sender;
    }

    // 地址比较  == 两个地址相等  ！= 两个地址不相等

    // function _onlyOwner() internal view {
    //     require(owner() == msg.sender, "调用者不是 Owner");
    //     _;
    // }

    // function transferOwnership(address newOwner) public onlyOwner {
    //     require(newOwner != address(0), "新的 Owner 不可以是 零地址");
    //     /// ....
    // }
}
