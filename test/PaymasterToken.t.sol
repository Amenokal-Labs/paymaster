// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {PaymasterToken} from "../src/PaymasterToken.sol";

contract PaymasterTokenTest is Test {

    PaymasterToken public paymasterToken;
    address owner;
    address spender;
    address receiver;

    function setUp() public {
        paymasterToken = new PaymasterToken();
        owner = address(this);
        spender = makeAddr("spender");
        receiver = makeAddr("receiver");

        paymasterToken.mint(owner, 100);
    }

    function testDeployer() public {
        assertEq(paymasterToken.owner(), owner);
        console.log("owner: ", owner);
    }

    function test_TransferWithApproval() public{
        paymasterToken.approve(spender, 50000000000000);
        assertEq(paymasterToken.allowance(owner, spender), 50000000000000);
    
        vm.prank(address(spender));
        paymasterToken.transferFrom(owner, receiver, 10000000);
        assertEq(paymasterToken.balanceOf(receiver), 10000000);
    }

    function testFail_TransferWithoutApproval() public{
        vm.prank(address(spender));
        paymasterToken.transferFrom(owner, receiver, 10000000);
        assertEq(paymasterToken.balanceOf(receiver), 10000000);
    }
}

