// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {Paymaster} from "../src/Paymaster.sol";


contract TestPaymaster is Test {

    Paymaster public paymaster;

    function setUp() public {
        paymaster = new Paymaster();
    }
}