// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract SumContract {

    //cosumo:
    function sum(uint256 _a, uint256 _b) public pure returns (uint256){
        return _a + _b;
    }

    //yul
    function sumYul(uint256 _a, uint256 _b) public pure returns (uint256 result){
        assembly{
            result := add( _a,  _b)
        }
    }

    //1 funcion hash Solidity
    function solidityHash(uint256 _a, uint256 _b) public pure {
        keccak256(abi.encodePacked(_a,_b));
    }

    // funcion hash con yul
    function yulHash(uint256 _a, uint256 _b) public pure{
        assembly{
            mstore(0x00, _a)
            mstore(0x20, _b)
            let hash := keccak256(0x00,0x40)
        }
    }

    //2 unchecked Solidity
    function uncheckedPlusPlusI() public pure {
        uint256 j = 0;
        for(uint256 i; i < 10; ){
            j++;
            unchecked {
                i++;
            }
        }
    }

    //2.2 unchecked con yul
    function uncheckedYul() public pure {
        assembly {
            let j := 0
            for {let i := 0} lt(i,10) {i := add(i,0x01)} {
                j := add(j, 0x01)
            }
        }
    }

    function subSolidityTest(uint256 _a, uint256 _b) public pure {
        uint256 c = _a - _b;
    }

    function subAssemblyTest(uint256 _a, uint256 _b) public pure {
        assembly {
            let c := sub(_a,_b)
            //verificar si ocurre un desborde negativo (underflow)
            if gt(c,_a){
                mstore(0x00, "underflow")
                revert(0x00,0x20)
            }
        }
    }

    address owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    function updateOwner(address newOwner) public {
        owner = newOwner;
    }

    address public propetario = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    function assemblyUpdateOwner(address nuevoPropetario) public {
        assembly{
            sstore(propetario.slot, nuevoPropetario)
        }
    }

}