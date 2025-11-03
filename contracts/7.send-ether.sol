// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;


contract SendEther{
    constructor () payable {}

    receive() external payable { }

    function testTransfer(address payable _to) external payable {
        _to.transfer(123);
    }

    function testSend(address payable _to) external payable {
       bool send = _to.send(123);
       require(send, "send failed");
    }

    function testCall(address payable _to) external payable {
        (bool send, ) = _to.call{value: 123}("");
        require(send, "call failed");
    }

}

contract RecibirEther {
    event Log(uint amount, uint gas);
    receive() external payable { 
        emit Log(msg.value, gasleft());
     }
}