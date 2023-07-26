// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import {Paymaster} from "../src/Paymaster.sol";



contract deployPaymaster is Script {
    function run() external returns (Paymaster) {
        vm.startBroadcast();
        Paymaster paymaster = new Paymaster();
        vm.stopBroadcast();

        return paymaster;
    }
}