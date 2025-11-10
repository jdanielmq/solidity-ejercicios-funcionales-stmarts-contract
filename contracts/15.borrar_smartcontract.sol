// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Kill {
    constructor() payable {}

    function killContract() external {
        // esta funcionalidad sera deprecada
        selfdestruct(payable(msg.sender));
    }

    function testContract() external pure returns(string memory){
        return "Estoy funcionando";
    }
}