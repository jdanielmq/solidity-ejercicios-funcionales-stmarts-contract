// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract DesplazandoIzquierda {
    uint[] public array;
    function deleteArray() public  {
        array = [1,2,3,4,5];
        delete array[1]; //[1,0,3,4,5]
    }

    // [1,2,3,4,5] -- remove(1) --> [1,2.3,4,5] --> [1,3,4,5]

    function remove(uint _index) public {
        //validacion, index sea menor que el array
        require(_index < array.length, "index fuera de rango");

        for (uint i = _index; i < array.length-1; i++) {
            array[i] = array[i+1];
        }
        array.pop();
    }

    function prueba() external {
        array = [1,2,3,4,5];
        remove(2);
        //[1,2,4,5]
        // podemos afirmar que 
        assert(array[0]==1);
        assert(array[1]==2);
        assert(array[2]==4);
        assert(array[3]==5);
        assert(array.length==4);
        array = [1];
        remove(0);
        assert(array.length==0);

    }
}

contract ReemplazarPorUltimo {
    uint[] public array;
    // [1,2,3,4] -- remove(1) --> [1,4,3]
    // [1,4,3] -- remove(2) --> [1,4]

    function remove(uint _index) public {
        array[_index] == array[array.length -1];
        array.pop();
        // [1,2,3,4] -- remove(1) --> [1,4,3,4] --> [1,4,3]

    }

    function prueba() external {
        array = [1,2,3,4];
        remove(1);
        assert(array[0]==1);
        assert(array[1]==4);
        assert(array[2]==3);
        assert(array.length==3);
    }

}