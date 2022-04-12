// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./ERC20.sol";

contract SimpleERC20 is ERC20 {
    constructor(string memory name, string memory symbol, uint8 decimal, uint256 totalSupply, uint256 initialSupply) ERC20(name, symbol, decimal, totalSupply, initialSupply) {
       //Supply Type is fixed
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }
}

