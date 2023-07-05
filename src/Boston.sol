// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Boston is ERC20 {
    constructor() ERC20("Boston", "BTN") {}
}