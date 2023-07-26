// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Paymaster{

    uint constant GAS_PRICE = 0.0009664 ether;
    uint constant CONVERTED_GAS_TO_TOKEN_PRICE = 1;

    mapping(IERC20 => mapping(address => uint)) public balances;

    function fillPaymaster(IERC20 token, uint amount) public{
        // token.approve(address(this), amount);
        token.transferFrom(msg.sender, address(this), amount);
        balances[token][msg.sender] += amount;
    }

    function sponsorGas(IERC20 token, address tokenAddress, address from, address target) public {
        token = IERC20(tokenAddress);
        uint gasPriceInETH = getRealGasPrice();
        uint gasPriceInTKN = convertGasToToken(/*token*/);
        require (balances[token][from] >= gasPriceInTKN, "Not enough balance");
        balances[token][from] -= gasPriceInTKN;
        // It's either we send directly eth
        payGasInETH(gasPriceInETH, payable(target));

        // Or we send the token
        token.approve(address(this), gasPriceInTKN);
        token.transferFrom(from, target, gasPriceInTKN);

        // I think with eth would be the optimal solution
    }

    function getRealGasPrice() public pure returns (uint256) {
        return GAS_PRICE;
    }

    function convertGasToToken(/*IERC20 token*/) public pure returns (uint256) {
        return CONVERTED_GAS_TO_TOKEN_PRICE;
    }

    function payGasInETH(uint amount, address payable target) public payable{
        target.transfer(amount);
    }

}