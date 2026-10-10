// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20Tokens is ERC20 {
    constructor() ERC20("VaultToken", "VT") { //(Inspired by: https://docs.openzeppelin.com/contracts/5.x/erc20-supply and https://docs.hedera.com/evm/quickstart/deploy-with-foundry)
    }

    function tokenCreation(uint256 tokenAmount) public returns (string memory) {
        _mint(msg.sender, tokenAmount); //tokens minted to caller //(Inspired by: https://docs.openzeppelin.com/contracts/5.x/erc20-supply)
        return "Your have created tokens!";
    }
}

contract Vault is ERC20Tokens {
    address vaultaddr = address(this); //(Inspired by: https://www.geeksforgeeks.org/ethical-hacking/difference-between-this-and-addressthis-in-solidity/)
    mapping(address => uint256) userDeposits;
    string error_msg = "This function is not possible";

    function deposit(uint256 depositAmount) public returns (string memory) {
        if (depositAmount > tokenAmount) {
            string error_msg;
        } else {
            _transfer(msg.sender, vaultaddr, depositAmount);
            userDeposits[msg.sender] += depositAmount;
            string confirmdeposit_msg = "You have successfull deposited to the vault!";
            return confirmdeposit_msg;
        }
    }

    function viewDeposits() public view returns (string, int256 memory) {
        //User can only view their own deposits
        string viewDeposit_msg = "Your total deposits are:";
        return (viewDeposit_msg, userDeposits[msg.sender]);
    }
}
