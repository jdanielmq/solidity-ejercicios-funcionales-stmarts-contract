// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract ReentrancyVulnerable {
    mapping(address => uint256) private balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) external {
        require(_amount <= balances[msg.sender], "saldo insuficiente");

        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Transferencia Fallida");

        balances[msg.sender] -= _amount;
    }
}