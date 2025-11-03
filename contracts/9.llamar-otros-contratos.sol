// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;



contract LlamarContratoPrueba {
    //funcion para establecer el valor de x en el contrato de prueba
    function setX(ContratoPrueba _test, uint _x) external {
        _test.setX(_x);
    }

    //funcion para obtener el valor de x en el contrato de prueba
    function getX(address _test) external view returns (uint x)  {
        x = ContratoPrueba(_test).getX();
    }

    //funcion para establecer el valor de x y enviar ether al contrato de prueba
    function setXandReceiveEther(address _test, uint _x) external payable {
        ContratoPrueba(_test).setXandReceiveEther{value: msg.value}(_x);
    }

    function getXandValue(address _test) external view returns (uint x, uint value)  {
        (x, value) = ContratoPrueba(_test).getXandValue();
    }
}


contract ContratoPrueba {
    uint public x;
    uint public value = 123;

    function setX(uint _x) external {
        x = _x;
    }

    function getX() external view returns (uint){
        return x;
    }

    function setXandReceiveEther(uint _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getXandValue() external view returns (uint, uint){
        return (x, value);
    }
}