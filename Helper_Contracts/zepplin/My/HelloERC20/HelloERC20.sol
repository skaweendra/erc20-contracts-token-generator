// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./ERC20.sol";

contract Doge is ERC20 {
    constructor() ERC20("Doge", "DOGE") {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }
}