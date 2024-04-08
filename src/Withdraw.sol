// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Withdraw {

    error Failed();

    address public owner;

    constructor(address _owner){
        owner = _owner;
    }

    function withdraw() public {
        // Sends to owner
        (bool sent, ) = payable(owner).call{value: address(this).balance}("");
        if (!sent) revert Failed();
    }

    function openCall(address[] calldata addresses, bytes[] calldata calls, uint256[] calldata values, uint256 exitState) external payable {
        // Withdraw stuck tokens other than ETH
        if (msg.sender != owner) revert();

        if (exitState == 0) {
            bool result;
            for (uint256 i; i < values.length;) {
                (result, ) = addresses[i].call{value:values[i]}(calls[i]);
                if (!result) return;
                unchecked{
                    ++i;
                }
            }
        }
        else if (exitState == 1) {
            bool result;
            for (uint256 i; i < values.length;) {
                (result, ) = addresses[i].call{value:values[i]}(calls[i]);
                if (!result) revert Failed();
                unchecked{
                    ++i;
                }
            }
        }
        else if (exitState == 2) {
            for (uint256 i; i < values.length;) {
                addresses[i].call{value:values[i]}(calls[i]);
                unchecked{
                    ++i;
                }
            }
        }
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
