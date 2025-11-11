// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract RaceConditionsOptimizado {
    uint256 public balance;

    mapping(address => uint256) private balances;
    mapping(address => bool) private isTranferring;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
        balance += msg.value;
    }

    function retirar(uint256 _cantidad) public {
        require(balances[msg.sender] >= _cantidad, "saldo insuficiente");
        require(!isTranferring[msg.sender], "la transferencia ya esta en curso");

        isTranferring[msg.sender] = true;
        require(payable(msg.sender).send(_cantidad), "error al realizar la transferencia");
        balances[msg.sender] -= _cantidad;
        isTranferring[msg.sender] = false;

    }

}