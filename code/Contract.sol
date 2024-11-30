// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GBS42 is ERC20Capped, Ownable {
    uint internal constant CAP = 100_000_000; 
    uint internal constant TOKEN_SIZE = 10 ** 18;
    constructor() ERC20("GBS42", "GBS") ERC20Capped(CAP * TOKEN_SIZE) Ownable(msg.sender) { 
        _mint(payable(owner()), 20_000_000 * TOKEN_SIZE);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount * TOKEN_SIZE);
    }
}
