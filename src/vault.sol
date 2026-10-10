// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20Tokens is ERC20 {
    constructor() ERC20("VaultToken", "VT") { //(Inspired by: https://docs.openzeppelin.com/contracts/5.x/erc20-supply and https://docs.hedera.com/evm/quickstart/deploy-with-foundry)
    }

    function tokenCreation(uint256 amount) public returns (string memory) {
        _mint(msg.sender, amount); //tokens minted to caller //(Inspired by: https://docs.openzeppelin.com/contracts/5.x/erc20-supply)
        return "Your have created tokens!";
    }
}

contract Vault is ERC20Tokens {
    address vaultaddr = address(this); //(Inspired by: https://www.geeksforgeeks.org/ethical-hacking/difference-between-this-and-addressthis-in-solidity/)
    mapping(address => uint256) userDeposits;

    function deposit(uint256 amount) public returns (string memory) {
        _transfer(msg.sender, vaultaddr, amount);
        userDeposits[msg.sender] += amount;
        string confirmdeposit_msg = "You have successfull deposited to the vault!";
        return confirmdeposit_msg;
    }

    function viewDeposits() view public returns (string,int memory){ //User can only view their own deposits
        string viewDeposit_msg = "Your total deposits are:"; 
        return (viewDeposit_msg, userDeposits[msg.sender]);
    }
}
