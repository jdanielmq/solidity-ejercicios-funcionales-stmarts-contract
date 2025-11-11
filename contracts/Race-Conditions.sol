// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract RaceConditionsVulnerrable {
    uint256 public balance;

    mapping(address => uint256) private balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
        balance += msg.value;
    }

    function retirar(uint256 _cantidad) public {
        require(balances[msg.sender] >= _cantidad, "saldo insuficiente");

        uint256 saldoAnterior = balances[msg.sender];

        balances[msg.sender] -= _cantidad;

        require(payable(msg.sender).send(_cantidad), "error al realizar la transferencia");

        require(balances[msg.sender] == saldoAnterior, "Race Condition detectada");

    }

}