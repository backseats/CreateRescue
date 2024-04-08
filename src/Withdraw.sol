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
// 0x78048FeB296975E6Ae7347f94b1a6D8d91a6F286 (deployed @ nonce 88)

// 1 txn on zora https://zora.superscan.network/address/0x78048feb296975e6ae7347f94b1a6d8d91a6f286

// 1 txn on sepolia https://sepolia.etherscan.io/address/0x78048feb296975e6ae7347f94b1a6d8d91a6f286

// ~100 txns on base https://basescan.org/address/0x78048feb296975e6ae7347f94b1a6d8d91a6f286

// 3 on polygon https://polygonscan.com/address/0x78048feb296975e6ae7347f94b1a6d8d91a6f286

// what are his current nonces on each network
// marka.eth nonces on each network
// i need to deploy a contract from marka.eth @ nonce 88 on each chain then withdraw


// base: next nonce: 56
// polygon: next nonce: 1
// sepolia: next nonce: 12 11155111
// zora: next nonce: 9 7777777
