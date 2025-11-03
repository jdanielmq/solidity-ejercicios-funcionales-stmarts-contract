// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Error {

    uint public num = 123;

    function testRequire(uint _i) public pure {
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint _i) public pure {
        if(_i > 10) {
            revert("Input must be greater than 10");
        }
    }

    function testAssert() public view  {
        assert(num==12);
    }


    error MyError(address caller, uint i);

    function testErrorPersonalizado(uint _i) public view  {
        if(_i > 10) {
            revert MyError(msg.sender, _i);
        }
    }
}