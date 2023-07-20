// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import {Paymaster} from "../src/Paymaster.sol";
import "@eth-infinitism/contracts/core/BasePaymaster.sol";
import {Paymaster} from "../src/Paymaster.sol";


contract deployPaymaster is Script {
    function run() external returns (Paymaster) {
        vm.startBroadcast();
        Paymaster paymaster = new Paymaster(IEntryPoint(0x5FF137D4b0FDCD49DcA30c7CF57E578a026d2789));
        vm.stopBroadcast();

        return paymaster;
    }
}