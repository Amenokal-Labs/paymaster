// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {PaymasterToken} from "../src/PaymasterToken.sol";

contract DeployPaymasterToken is Script {
    function run() external returns (PaymasterToken) {
        vm.startBroadcast();
        PaymasterToken paymasterToken = new PaymasterToken();
        vm.stopBroadcast();

        return paymasterToken;
    }
}
