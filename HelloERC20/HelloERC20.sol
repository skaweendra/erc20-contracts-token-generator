// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./ERC20.sol";

contract HelloERC20 is ERC20 {
    constructor(string memory name, string memory symbol, uint8 decimal, uint256 totalSupply) ERC20(name, symbol, decimal, totalSupply) {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }
}