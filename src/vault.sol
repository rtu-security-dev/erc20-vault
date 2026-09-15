// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20Vault is ERC20 {
    constructor() ERC20("VaultToken", "VT") { //(Inspired by: https://docs.openzeppelin.com/contracts/5.x/erc20-supply)
    }

    address public Vault;
    mapping(address => uint256) userDeposits;
    string confirmdeposit = "You have successfull deposited to the vault!";

    function tokenCreation(uint256 amount) public returns (string) {
        _mint(msg.sender, amount); //tokens minted to caller //(Inspired by: https://docs.openzeppelin.com/contracts/5.x/erc20-supply)
        return "Your have created tokens!";
    }

    function deposit(uint256 amount) public returns (string memory) {
        _transfer(msg.sender, Vault, amount);
        userDeposits[msg.sender] += amount;
        return confirmdeposit;
    }
}
