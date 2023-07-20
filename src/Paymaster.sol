// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@eth-infinitism/contracts/core/BasePaymaster.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import {PaymasterToken} from "./PaymasterToken.sol";

contract Paymaster is PaymasterToken, BasePaymaster {
    
    IERC20 paymaster;
    mapping (address => uint256) public balances;
    
    constructor(IEntryPoint _entryPoint, address token) BasePaymaster(_entryPoint) {
        paymaster = IERC20(token);
    }

// We don't need this function for now, but as the Paymaster is a BasePaymaster, we need to implement it.
    function _validatePaymasterUserOp(
        UserOperation calldata userOp,
        bytes32 userOpHash,
        uint256 maxCost
    )
        internal
        virtual
        override
        returns (bytes memory context, uint256 validationData)
    {}

    function fillPaymaster(uint amount) public{
        paymaster.approve(address(this), amount);
        paymaster.transferFrom(msg.sender, address(this), amount);
        balances[msg.sender] = amount;
    }

    function getEthPrice(uint256 amount) public view returns (uint256) {
        return 0;
    }

    function getGasPrice(uint256 amount) public view returns (uint256) {
        return 0;
    }

    function sendGas(uint256 amount, address target) public {
        paymaster.transfer(target, amount);
    }


}
