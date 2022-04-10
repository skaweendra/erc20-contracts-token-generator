/**
 * @file SimpleERC20Token.sol
 * @author Kaweendra S. <salitha.wijerathna@gmail.com>
 * @date 2022-03-09
 */
// SPDX-License-Identifier: MIT
//verified - https://ropsten.etherscan.io/address/0x0fE1B1151D281A9BE9245018F18a946C1F96484B#code

pragma solidity ^0.8.7;

contract SimpleERC20Token {
    // Track how many tokens are owned by each address.
    mapping (address => uint256) public balanceOf;

    string public name;
    string public symbol;
    uint8 public decimals;

    uint256 public totalSupply = 1000000 * (uint256(10) ** decimals);

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor (string memory _name,string memory _symbol,uint8 _decimals){
         name = _name;
         symbol = _symbol;
         decimals = _decimals;
	 }

    function SimpleERC20Tokens() public {
        // Initially assign all tokens to the contract's creator.
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value);

        balanceOf[msg.sender] -= value;  // deduct from sender's balance
        balanceOf[to] += value;          // add to recipient's balance
        emit Transfer(msg.sender, to, value);
        return true;
    }

    event Approval(address indexed owner, address indexed spender, uint256 value);

    mapping(address => mapping(address => uint256)) public allowance;

    function approve(address spender, uint256 value)
        public
        returns (bool success)
    {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value)
        public
        returns (bool success)
    {
        require(value <= balanceOf[from]);
        require(value <= allowance[from][msg.sender]);

        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        emit Transfer(from, to, value);
        return true;
    }
}