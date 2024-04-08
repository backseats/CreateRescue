// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
// import { Withdraw } from "../src/Withdraw.sol";

interface IBatchSend {
    function send(
        address[] calldata recipients,
        uint256[] calldata amounts
    ) external payable;
}

// forge script script/Distribute.s.sol:DistributeScript --rpc-url $BASE_RPC_URL chain-id 8453 -vv

contract DistributeScript is Script {

    IBatchSend public batchSend = IBatchSend(0xaBD67fE3BF7Fda2606c61d300C1c239C4fbAc088);

    address[] public addresses = [
  0x7933d3D22E8C3D172fCe5CE5F35604331f322269,
  0xbfF29b6cfD0c6BC845D4f70BDeeb3378a4AD39BF,
  0x55dB1984E12863A7a667b222f9Cc37D91e9FE010,
  0xE319846e2aBa96B31Ac4588feD861158040B3061,
  0xE6c95CF4a1AE50BB83c103D0f49Ad80D11b04912,
  0xb7CEEAE5C4762AdfF47029312Ae32521f8D1C774,
  0xD3253d12cEEa00570c41C9e537c10176ff8af15c,
  0xbCC44956d70536bed17C146a4D9E66261BB701DD,
  0x9424116b9D61d04B678C5E5EddF8499f88ED9ADE,
  0x450A5D5438271e6e5f0dE4fc0f065f126A5eB06f,
  0x29e9aB2D0408Ab629b3984690D829cdce2a4C6f1,
  0xa1969963cFa87Ed65203B4Cb5f2001b8CE38a22A,
  0x04EE22568B4ABBfF87a6827BC4f801b81D99146B,
  0x05bFBa34a229dD926208dC4Bca5Be4e2d3235eE5,
  0x8a3859B660864a05CE76A6901d2628D947e224D8,
  0x7D0051Dd1b619fB0Ddf77d61Bd7131C5Be5CDA08,
  0xB7E2f7243880295D4830bFb19fC4CB318031B851,
  0x2D39849e0404Db38C02901c161DD800627c8Ef45,
  0xe9446bC303A4861248feBebcbFd5D2054CF45B81,
  0xB79358706372877A4125ed370485efdb8fF8aa70,
  0x4f546b0Ef4f7711CEa7c0B1b7dda0a200cb2DFa9,
  0x8c965cE0732a8BD220f6A645e685A2D0d7c65866,
  0x327C86581E15d6A72207e655216938Ef10C78999,
  0xd2B93Be05396f16a038716d2eA4C8FB547d92A0d,
  0xc008FCe4b57d66D8E0770306b28b04aC45565cf0,
  0x73B137B9a4c0AcEf107eD63064a14d7EDfeF6DbC,
  0x7c5a2B10ea3B8962FD4f8cefF6535b57d676d81d,
  0xe45208F300bea52772e7AcFd8008BBD6f3d801a9,
  0xeebFd0aE2CE773dB3dADAd8D51Ad59eC11567F16,
  0xe7BDafA518bdd898EC3312B0cC32cD6F59567B91,
  0xE0b3D97C875a8D9bA5e45afbe9282047754F7485,
  0x0ce63D8B1780914540c9F3EFB4bfEeca1995c7DE,
  0x7cFDbBBD489199701f9d72f3AFEe1029708c5360,
  0x2C0A4A5fa30fd5d34fF770f0113d23F952fFfBAB,
  0x897E9AD9cc1D371A867E5eCE30269C76CEaC418f,
  0x757b1fbdD93503d9CD6c472DC5FE8Ba9d5144C35,
  0x467cc59F1ce2045b0cDc4E85d941BD8cb8DCBd2e,
  0x040FC4f814321242c4E19114cFD7493BEbB3B121,
  0x2e4A55927e6C3B23257dEAF3Ef33311c549148F2,
  0xD56B8A24032ee6A39bBa357fD28cb68E8ec0a82F,
  0xA18D38827d1852e55AA79cbB7e5639dBf5D4df9a,
  0x7aFDaD9C440441f8E7C679Ba325D0c41e6161E72,
  0x2297d2E8Dc151B82Ee631B4f680c28B7AAE837BF,
  0xeB89055E16Ae1C1e42Ad6770A7344Ff5C7B4f31D,
  0x254eC67Ac545862191dC63E94DE8cD14Acd84140,
  0xd62Bd8569622FBD2C3bf8DCF5E4236a240254729,
  0xD6b06515617079554c592A645c7d204FaA2c857a,
  0x435e91D318aBccd10eee5c313a16130F5Dd6dB1a,
  0x5a01feb1100f52Fc67A474A610FFE3DB549E7b7B,
  0x7771542817a60e167FD8Ed2D8F84a88062863f4B,
  0xaa6c368f0DC5DF31fcC4f930C3e1fec2A614c716,
  0xFa011166d5776Fbfa0735A7aCF73865A45B51478,
  0x7B987B92716dE129d67F51d16A1699D04F6c035D,
  0x585464a6B78028A90AAAe2f2116C65E6130761cc,
  0x189E61E95722f868cc3537b583Fb88A80cf6Be16,
  0x2786e926094779aD01777afb9A0d7e0198AbB638,
  0x47E9432EeD8Ea83f6448B88563F92fc7E5615B0a,
  0x07b8D5eC0cCA0566600eF770cE41E47e78281C7f,
  0xB4404B1aE544247893bD5F36fb8799dE303F31c9,
  0x191d9525C7A2A2ae98A0b34D93E8CB5C1d1ae1F1,
  0xFcf323eEf14Dfc8f7A856fF85D1121AD955Cc813,
  0x5bc05b93aE5c7cB44A8C78f13eFdb9e9EA209356,
  0xa819cd56bEe75b149dBd574942170a607e22377D,
  0xcB263A6612EF1108C774b8d5Ad3F8E46bcf22350,
  0xbe2e8F6292D29c65F9BCd807bE387422857B4093,
  0x76d466371c0e68bd2C20D7B1DF8A5B959d38FfD5,
  0x220452c66D0CCD7A46C064dA784C444939509821,
  0x465f6D56F7C42ef72cE3fBD112AB9842f80e10f3,
  0x777a89166b1265ec9D2CAB2DF5db59D1f50621d1,
  0xb931044c1B890A02A8dE21A3cB71AeEaC2cFF415,
  0x72285F27A6663cB0f88263e999ecF7EFa1b12055,
  0xe310051C8bE320A46D51740949Cd32378063b769
];

    uint256[] public amounts = [
        249000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        249000000000000000,
        83000000000000000,
        83000000000000000,
        166000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        498000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        166000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        249000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        166000000000000000,
        83000000000000000,
        83000000000000000,
        249000000000000000,
        332000000000000000,
        830000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        166000000000000000,
        166000000000000000,
        83000000000000000,
        83000000000000000,
        249000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        166000000000000000,
        166000000000000000,
        83000000000000000,
        83000000000000000,
        83000000000000000,
        415000000000000000
    ];

    function setUp() public {
    }

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        batchSend.send{value: 9.13 ether}(addresses, amounts);

        vm.stopBroadcast();

    }

}