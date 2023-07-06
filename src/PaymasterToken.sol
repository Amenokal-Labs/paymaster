// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PaymasterToken is ERC20, Ownable {
    constructor() ERC20("PaymasterToken", "PMT") {}

    function mint(address _to, uint256 amount) public onlyOwner {
        _mint(_to, amount * 10 ** decimals());
    }
}