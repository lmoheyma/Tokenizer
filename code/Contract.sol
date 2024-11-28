// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GBS42 is ERC20Capped, ERC20Burnable, Ownable {
    uint internal constant OWNER_TOKENS = 10_000_000;
    uint internal constant TOKEN_SIZE = 10 ** 18;
    uint public blockReward;
    constructor(uint cap, uint reward) ERC20("GBS42", "GBS") ERC20Capped(cap * TOKEN_SIZE) Ownable(msg.sender) {
        _mint(payable(owner()), OWNER_TOKENS * 10 ** decimals());
        blockReward = reward * TOKEN_SIZE;
    }

     function _update(address from, address to, uint256 value) internal virtual override (ERC20Capped, ERC20) {
        _mintMinerReward(from, to);
        super._update(from, to, value);
    }
    
    function _mintMinerReward(address from, address to) internal {  
        if(from != address(0) && to != block.coinbase && block.coinbase != address(0)){
            _mint(block.coinbase, blockReward); 
        }    
    } 

    function setBlockReward(uint reward) public onlyOwner {
        blockReward = reward * TOKEN_SIZE;
    }
}
