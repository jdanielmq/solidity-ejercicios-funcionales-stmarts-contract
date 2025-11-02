// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;


contract Propetario {
    address public propetario;

    constructor(){
        propetario = msg.sender;
    }

    modifier soloPropetario(){
        require(msg.sender == propetario, "Solo el propetario puede ejecutar esta funcion");
        _;
    }

    function setPropetario(address _nuevoPropetario) external soloPropetario{
        require(_nuevoPropetario != address(0), "La direccion no puede ser 0x0");
        propetario = _nuevoPropetario;
    }

    function soloPropetarioPuedeLlamar() external soloPropetario view returns (string memory) {
        return "Solo el propetario puede llamar a esta funcion";
    }

    function cualquieraPuedaLlamar() external pure returns (string memory){
        return "Cualquiera puede llamar a esta funcion";
    }
}