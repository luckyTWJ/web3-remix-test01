// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0;

contract TestAddr {
    // 如果合约的余额大于等于10，而x小于10,则给x转10 wei
    function testTransfer(address payable x) public {
        //就是把合约转换为地址类型
        //在账户中，在 EVM 层面是，外部用户账户和合约账户是一样的，因此可以把合约类似转换为地址类型
        address  myaddress = address(this);
         
        if (x.balance < 10 && myaddress.balance >= 10) {
            //然后用.balance获取余额， 再使用 .transfer 向 x 转账。
            myaddress.transfer(10);
        }
    }

    // function safeTransferETH(address to,uint256 value) internal {
    //     bool success = to.call{value:value}(new byte(0));
    //     require(success,'TransferHelper::safeTransferETH: ETH transfer failed');
    // }

}

