// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {Boston} from "../src/Boston.sol";

contract CounterTest is Test {
    Boston public boston;

    function setUp() public {
        boston = new Boston();
    }

    function testDeployerPunch() public{
        assertEq(boston.owner(), address(this));
        console.log("Boston Owner: ", boston.owner());
        console.log("Contract address: ", address(this));
        }
}
