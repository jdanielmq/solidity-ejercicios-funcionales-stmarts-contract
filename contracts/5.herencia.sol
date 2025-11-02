// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract A {
    function foo() external pure virtual  returns (string memory) {
        return "A";
    }
    function bar() external pure virtual  returns (string memory) {
        return "A";
    }

    // mas funciones
    function baz() public pure returns (string memory) {
        return "A";
    }

}

contract B  is A {
    function foo() override external pure returns (string memory) {
        return "B";
    }

    function bar() override  external pure virtual  returns (string memory) {
        return "B";
    }
    
}

contract C is B {
     function bar() override external pure returns (string memory) {
        return "C";
    }

}