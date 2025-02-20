// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0;

contract TestArray {
    // 状态变量缺省位置为 storage
    uint256[10] public tens; // 固定长度的数组
    uint256[] numbers; // 动态长度的数组

    string[4] public address1 = ["112", "22", "333", "334"];

    uint256[] public arr = [133, 244, 553, 466];
    // storage 位置
    uint256[] public arr1 = new uint256[](1);

    function add(uint256 a) public {
        // 用来添加给定元素到数组末尾。push(x) 没有返回值，方法只对存储（storage）中的动态数组有效
        arr1.push(a);
    }

    function arr1Len() public view returns (uint256 len) {
        return arr1.length;
    }

    function getarr1(uint256 i) public view returns (uint256) {
        return arr1[i];
    }

    //数组切片
    function forward(bytes calldata payload) external {
        // x[start:end] ， start 和 end是uint256类型（或结果为uint256的表达式），
        // x[start:end] 的第一个元素是x[start]， 最后一个元素是x[end - 1]
        // start默认是0，而end默认是数组长度，start和end都可以是可选的
        bytes4 sig = bytes4(payload[:4]);  // 获得函数选择器
    }

    // 作为参数，使用 calldata
    function copy(uint256[] calldata data) public {
        numbers = data; //  赋值时，不同的数据位置的变量会进行拷贝。
    }

    function handle(uint256[] memory data) internal {}

    function testNew(uint256 len) public {
        //在内存中
        uint256[] memory m = new uint256[](len);
        string[4] memory ss = ["111", "222", "333", "3444"];
        //固定长度的数组只能通过下标访问方式赋值
        // arr1[3] = "444";
        // uint len = ss.length+m.length;
        // ss[0]='000';
    }
}
