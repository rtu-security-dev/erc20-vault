// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/*
Referenced: https://docs.openzeppelin.com/contracts/5.x/erc20-supply
 */
contract ERC20Vault is ERC20 {
    constructor() ERC20("VaultToken", "VT") {
        _mint(msg.sender, 500); //tokens minted to account
    }

    mapping(address => uint256) userDeposits;
    string confirmdeposit = "You have successfull deposited to the vault!";

    function deposit(uint256 amount) public returns(string memory) {
        if (userDeposits[msg.sender]>0){
            _burn(msg.sender, amount);
            return confirmdeposit;
        } else {
            return "You have no tokens to deposit!";
        }
    }
}
