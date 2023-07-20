// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {Paymaster} from "../src/Paymaster.sol";
import "@eth-infinitism/contracts/interfaces/IEntryPoint.sol";


contract TestPaymaster is Test {

    Paymaster public paymaster;

    function setUp() public {
        paymaster = new Paymaster(IEntryPoint(0x5FF137D4b0FDCD49DcA30c7CF57E578a026d2789), 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        // The address of the IEntryPoint is found in the deploy script of the ERC4337.
        // The address of the token is not real, I used it just to get rid of the errors.
    }

    function testfillPaymaster() public {}
}