// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20Vault is ERC20 {
    constructor() ERC20("VaultToken", "VT") {  //(Inspired by: https://docs.openzeppelin.com/contracts/5.x/erc20-supply)
    }

    mapping(address => uint256) userDeposits;
    string confirmdeposit = "You have successfull deposited to the vault!";

    function deposit(uint256 amount) public returns (string memory) {
        if (userDeposits[msg.sender] > 0) { //user must have a deposit previosuly
            _mint(msg.sender, amount); //tokens minted to account //(Inspired by: https://docs.openzeppelin.com/contracts/5.x/erc20-supply)
            userDeposits += amount;
            return confirmdeposit;
        } else {
            return "You have no tokens to deposit!";
        }
    }
}
