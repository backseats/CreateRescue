## CreateRescue

By [Marka.eth](https://twitter.com/marka_eth), [Backseats.eth](https://twitter.com/backseats_eth), and [Jalil.eth]((https://twitter.com/jalil_eth))

This repo illustrates how to use Foundry tests and scripts to simulate and deploy a contract to an address that has ETH in it.

It, of course, assumes that you deployed something to the same address with the stuck funds in it, from the same wallet on another network.

It also assumes that your nonce on other networks is **lower** than your nonce on the network where the contract is deployed. If the nonce on another network is higher, you can't deploy anything to the target address you're trying to reach.

### Usecase:

* Marka deployed a contract [DegenerativeGames](https://www.contractreader.io/contract/mainnet/0x78048feb296975e6ae7347f94b1a6d8d91a6f286) on ETH mainnet at nonce 88.

* Because of a bug in the minting website that didn't force the user to switch to mainnet, people minted to other networks (which was really just a send with a function signature)

* 9.13 ETH was sitting in the [same address on Base](https://basescan.org/address/0x78048feb296975e6ae7347f94b1a6d8d91a6f286) and Marka's nonce for the same address that deployed the mainnet wallet (0x16e23099cca4092C6c7ea3a56506aF6DCc58383A) was at 56.

This script shows you how to run N transactions to get to target nonce - 1 (in this case, 87), deploy a contract from the same address with the target nonce, and then withdraw that ETH.

### How?

By default, ETH deploys use the `CREATE` opcode. `CREATE` is deterministic, using `keccak256(sender, nonce)` to calculate the address that the code will be deployed. **Thats what we'll use here.**

Many people are familiar with `CREATE2` `keccak256(0xFF, sender, salt, keccak256(bytecode))` which has a different function signature and can be used to deploy the same address across multiple networks, regardless of your `nonce` since it uses a `salt` and the contract's bytecode to determine the address.

So assuming you're using the same deployer wallet, you just need to do N transactions to get your nonce to be one less than the nonce you used on the other network. Then when you deploy on the new network with that same nonce, you'll get the same contract address, to which you can deploy any contract. It doesn't have to resemble the contract on the other network at all.

In our case, we used something very simple

```solidity
contract Withdraw {

    error Failed();

    receive() external payable {}

    function withdraw() public {
        // Sends to marka.eth
        (bool sent, ) = payable(0x16e23099cca4092C6c7ea3a56506aF6DCc58383A).call{value: address(this).balance}("");
        if (!sent) revert Failed();
    }

}
```

### How to run

* Clone the repo

* Copy `.env.example` into a new `.env` file

* Add in the values and run `source .env` in your console to load in env vars

* `forge build`

* See notes in the `test` and `script` dirs on how to run each.

### If you need to airdrop ETH back to people

[Gaslite Drop](https://drop.gaslite.org/) is a great, gas-efficient resource. Also developed in part by Backseats.

### Foundry Book (if you need it)

https://book.getfoundry.sh/

### Acknowledgements

Thank you to OptimizationFans (specifically WOK, Michael Amadi, and boredretard.eth) for their help as well.

### Contribution Instructions

Feel free to create a Pull Request or an Issue if necessary.

### Code of Conduct

Just be excellent to everyone ✌🏻
