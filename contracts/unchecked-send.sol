// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract UncheckedSend{
    mapping(address => uint256) private balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

     function withdraw(uint256 _amount) external {
        require(balances[msg.sender] <= _amount,  "saldo insuficiente");
        //vulnarabilidad
        //payable(msg.sender).transfer(_amount);

        require(payable(msg.sender).send(_amount), "fallo el envio");

        balances[msg.sender] -= _amount;
    }   

}