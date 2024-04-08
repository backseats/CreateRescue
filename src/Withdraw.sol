// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Withdraw {

    error Failed();

    receive() external payable {}

    function withdraw() public {
        // Sends to marka.eth
        (bool sent, ) = payable(0x16e23099cca4092C6c7ea3a56506aF6DCc58383A).call{value: address(this).balance}("");
        if (!sent) revert Failed();
    }

}


// contract on mainnet
// 0x78048FeB296975E6Ae7347f94b1a6D8d91a6F286
