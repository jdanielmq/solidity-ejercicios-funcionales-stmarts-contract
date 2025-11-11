// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract ReentrancyOptimizado {
    mapping(address => uint256) private balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) external {
        require(balances[msg.sender] <= _amount,  "saldo insuficiente");

        require(payable(msg.sender).send(_amount), "saldo infucientes");

        balances[msg.sender] -= _amount;
    }
}