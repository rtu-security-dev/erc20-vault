// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20Vault is ERC20 {
    constructor() ERC20("VaultToken", "VT") {  //(Inspired by: https://docs.openzeppelin.com/contracts/5.x/erc20-supply)
    _mint(msg.sender, 500); //tokens minted to caller //(Inspired by: https://docs.openzeppelin.com/contracts/5.x/erc20-supply)
    }

    mapping(address => uint256) userDeposits;
    string confirmdeposit = "You have successfull deposited to the vault!";

    function deposit(address receiver, uint256 amount) public returns (string memory) {
        _transfer(msg.sender, receiver, amount); 
        userDeposits[msg.sender] += amount;
        return confirmdeposit;
    }
}
