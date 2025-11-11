// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;


contract secureAccesoControl {
    uint private secretNumber;
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "solo el propetario puede hacer la llama a la funcion");
        _;
    }

    function setSecretNumber(uint _newNumber) public {
        secretNumber = _newNumber;
    }

    function getSecretNumber() public view returns(uint){
        return secretNumber;
    }

    

}