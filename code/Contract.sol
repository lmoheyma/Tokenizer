// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GBS42 is ERC20Burnable, Ownable {
    constructor() ERC20("GBS42", "GBS") Ownable(msg.sender) { }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
