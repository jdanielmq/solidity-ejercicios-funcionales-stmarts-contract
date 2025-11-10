// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract OptimizadoFallback {
    mapping(address => uint256) private balances;

    fallback() external payable {
        revert("Esta funcion fallback no esta habilitada para recibir pagos.");
    }

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "No hay fondos disponibles para retirar");
        balances[msg.sender] = 0;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transferencia fallida");
    }

    receive() external payable {}
}