// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import { Withdraw } from "../src/Withdraw.sol";

contract CreateRescueScript is Script {

    address public marka = 0x16e23099cca4092C6c7ea3a56506aF6DCc58383A;

    address public dustWallet = 0xF3C7D8bbaf6F0A1a5aa03C7B13FB7326553E4904;

    address targetContractAddress = 0x78048FeB296975E6Ae7347f94b1a6D8d91a6F286;

    // forge script script/CreateRescue.s.sol:CreateRescueScript --rpc-url $BASE_RPC_URL --etherscan-api-key $BASESCAN_API_KEY --chain-id 8453 --private-key $BASE_PRIVATE_KEY --broadcast --verify -vvvv

    // forge script script/CreateRescue.s.sol:CreateRescueScript --rpc-url $BASE_RPC_URL --etherscan-api-key $BASESCAN_API_KEY --chain-id 8453 -vvvv

    // forge script script/CreateRescue.s.sol:CreateRescueScript --rpc-url $BASE_RPC_URL --etherscan-api-key $BASESCAN_API_KEY --chain-id 8453 -vvvv

    // forge script script/CreateRescue.s.sol:CreateRescueScript --rpc-url $SEPOLIA_RPC_URL --chain-id 11155111 -vv

    // sepolia
    // zora
    // base

    function setUp() public {
        console2.log("marka.balance", marka.balance); // might need to fund this wallet on other networks
        uint256 nonce = vm.getNonce(marka);
        // emit log_uint(nonce); // 0
        console2.log("nonce", nonce);

        console2.log("target contract address balance", targetContractAddress.balance);
    }

    function run() public {
        uint payment = 1 wei;
        uint nonce = vm.getNonce(marka);
        uint txnsToSpend = 88 - nonce; // 88-56 = 32 (base)


        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        console2.log('dust sending beginning...');
        for (uint256 i = 0; i < txnsToSpend; i++) {
            // uint _nonce = nonce + i;
            // console2.log('sending payment with nonce', _nonce);
            (bool sent, ) = payable(dustWallet).call{value: payment}("");
            assert(sent);
        }

        console2.log('dust sending finished');

        // console2.log("marka.balance (before)", marka.balance);
        // vm.setNonce(marka, 88);

        // Deploy

        console2.log('deploying withdraw contract...');
        Withdraw w = new Withdraw();

        // Withdraw
        console2.log('withdrawing...');
        w.withdraw();

        vm.stopBroadcast();

        console2.log("target contract address balance", targetContractAddress.balance); // expect 0
        console2.log("marka.balance (after)", marka.balance); // expect 9.13+ ETH

    }
}
