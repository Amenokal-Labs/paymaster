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
        spender = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
        receiver = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC;

        paymasterToken.mint(owner, 100);
    }

    function testDeployer() public {
        assertEq(paymasterToken.owner(), owner);
        console.log("PaymasterToken Owner balance: ", paymasterToken.balanceOf(owner));
    }

    function testApprove() public{
        paymasterToken.approve(spender, 500000000);
        assertEq(paymasterToken.allowance(owner, spender), 500000000);
        console.log("Spender: ", paymasterToken.allowance(owner, spender));
    }

    function testTransfer() public{
        paymasterToken.transfer(receiver, 300000000000000);
        assertEq(paymasterToken.balanceOf(receiver), 300000000000000);
        console.log("Client: ", paymasterToken.balanceOf(receiver));
        console.log("Owner: ", paymasterToken.balanceOf(owner));
    }
}
