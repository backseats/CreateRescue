// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Withdraw} from "../src/Withdraw.sol";

/*
Simulate
- mock his address on base
- Fork now
- Print nonce on base (should be 55)
- Do 22 txns to send to 87 (send dust to other address)
- Verify next nonce is 88
- Deploy contract
- Verify it’s the address we expect
*/

contract WithdrawTest is Test {
    Withdraw public withdraw;

    // starting value 188013779160732963 (0.188013779160732963 ETH)
    address public marka = 0x16e23099cca4092C6c7ea3a56506aF6DCc58383A;

    address public backseats = 0x3a6372B2013f9876a84761187d933DEe0653E377;

    // 9130000000000000000 (9.13 ETH)
    address targetContractAddress = 0x78048FeB296975E6Ae7347f94b1a6D8d91a6F286;

    function setUp() public {
        // withdraw = new Withdraw();
    }

    // forge test --rpc-url $BASE_RPC_URL --etherscan-api-key $BASESCAN_API_KEY --chain-id 8453 -vvvv
    // note: need to update the RPC url and likely do `source

    // i need to test on chain id 8453
    function test_currentValuesOnBase() public {
        // 0.188013779160732963 ETH on base
        // 0.344639130540037113 ETH on sepolia
        console2.log("marka.balance", marka.balance); // might need to fund this wallet on other networks
        uint256 nonce = vm.getNonce(marka);
        emit log_uint(nonce); // 0

        console2.log("target contract address balance", targetContractAddress.balance);

        // Put your PK in here
        // bytes32 privateKey = 0xfb2b636c66fa0d60f1b960d9a8db3a8f1f0fdfcde8c574d1e80eabd48099cbfd;
        // address derivedAddress = vm.addr(uint256(privateKey));
        // assertEq(derivedAddress, 0xa521f9f3185F626bdBDbC5Adf7a164a86d190E3B);
    }

    // forge test --rpc-url $BASE_RPC_URL --etherscan-api-key $BASESCAN_API_KEY --chain-id 8453 -vvvv

    // function test_sendDustBase() public {
    //     // send 32 tiny txns from marka to backseats
    //     vm.startPrank(marka);

    //     uint payment = 1 wei;
    //     uint nonce = vm.getNonce(marka);
    //     uint txnsToSpend = 88 - nonce; // 88-56 = 32 (base)

    //     for (uint256 i = 0; i < txnsToSpend; i++) {
    //         uint _nonce = nonce + i;
    //         console2.log('sending payment with nonce', _nonce);
    //         (bool sent, ) = payable(backseats).call{value: payment}("");
    //         assert(sent);
    //     }

    //     console2.log("marka.balance (before)", marka.balance);
    //     vm.setNonce(marka, 88);

    //     // Deploy
    //     Withdraw w = new Withdraw();
    //     // Withdraw
    //     w.withdraw();

    //     console2.log("target contract address balance", targetContractAddress.balance); // expect 0
    //     console2.log("marka.balance (after)", marka.balance); // expect 9.13+ ETH
    // }

    // forge test --rpc-url $ZORA_RPC_URL --chain-id 7777777 -vvvv
    // function test_sendTestDustZora() public {
    //     vm.startPrank(marka);

    //     uint payment = 1 wei;
    //     uint nonce = vm.getNonce(marka); // should be 9
    //     console2.log("nonce", nonce);
    //     uint txnsToSpend = 88 - nonce; // 88-56 = 32 (base)
    //     console2.log("txnsToSpend", txnsToSpend);

    //     for (uint256 i = 0; i < txnsToSpend; i++) {
    //         uint _nonce = nonce + i;
    //         console2.log('sending payment with nonce', _nonce);
    //         (bool sent, ) = payable(backseats).call{value: payment}("");
    //         assert(sent);
    //     }

    //     console2.log("marka.balance (before)", marka.balance);
    //     vm.setNonce(marka, 88);

    //     // Deploy
    //     Withdraw w = new Withdraw();
    //     // Withdraw
    //     w.withdraw();

    //     console2.log("target contract address balance", targetContractAddress.balance); // expect 0
    //     console2.log("marka.balance (after)", marka.balance); // expect 0.083+ (send to 0xdB89eDDeDe70c0ca0adE34825397515851a38536)
    // }

    // forge test --rpc-url $SEPOLIA_RPC_URL --chain-id 11155111 -vv
    // function test_sendTestDustSepolia() public {
    //     vm.startPrank(marka);

    //     uint payment = 1 wei;
    //     uint nonce = vm.getNonce(marka); // should be 8
    //     console2.log("nonce", nonce);
    //     uint txnsToSpend = 88 - nonce; // 88-56 = 32 (sepolia)
    //     console2.log("txnsToSpend", txnsToSpend);

    //     for (uint256 i = 0; i < txnsToSpend; i++) {
    //         uint _nonce = nonce + i;
    //         console2.log('sending payment with nonce', _nonce);
    //         (bool sent, ) = payable(backseats).call{value: payment}("");
    //         assert(sent);
    //     }

    //     console2.log("marka.balance (before)", marka.balance);
    //     vm.setNonce(marka, 88);

    //     // Deploy
    //     Withdraw w = new Withdraw();
    //     // Withdraw
    //     w.withdraw();

    //     console2.log("target contract address balance", targetContractAddress.balance); // expect 0
    //     console2.log("marka.balance (after)", marka.balance); // expect 0.083+ (send to 0xdB89eDDeDe70c0ca0adE34825397515851a38536)
    // }

    // forge test --rpc-url $POLYGON_RPC_URL --chain-id 137 -vv
    // function test_sendTestDustPolygon() public {
    //     vm.startPrank(marka);

    //     uint payment = 1 wei;
    //     uint nonce = vm.getNonce(marka); // should be 8
    //     console2.log("nonce", nonce);
    //     uint txnsToSpend = 88 - nonce; // 88-56 = 32 (sepolia)
    //     console2.log("txnsToSpend", txnsToSpend);

    //     for (uint256 i = 0; i < txnsToSpend; i++) {
    //         uint _nonce = nonce + i;
    //         console2.log('sending payment with nonce', _nonce);
    //         (bool sent, ) = payable(backseats).call{value: payment}("");
    //         assert(sent);
    //     }

    //     console2.log("marka.balance (before)", marka.balance);
    //     vm.setNonce(marka, 88);

    //     // Deploy
    //     Withdraw w = new Withdraw();
    //     // Withdraw
    //     w.withdraw();

    //     console2.log("target contract address balance", targetContractAddress.balance); // expect 0
    //     console2.log("marka.balance (after)", marka.balance); // expect 0.083+ (send to 0xdB89eDDeDe70c0ca0adE34825397515851a38536)
    // }

}
