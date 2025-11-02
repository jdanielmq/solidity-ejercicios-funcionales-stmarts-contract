// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract X {
    function foo() public pure virtual  returns (string memory) {
        return "X";
    }
    function bar() public pure virtual  returns (string memory) {
        return "X";
    }

    function baz() public  pure returns (string memory) {
        return "X";
    }
}

contract Y is X {
    function foo() override  public pure virtual returns (string memory) {
        return "Y";
    }

    function bar() override  public  pure virtual returns (string memory) {
        return "Y";
    }

    function y() public pure returns (string memory) {
        return "Y";
    }
}

contract Z is X, Y {

    function foo() override(X, Y)  public  pure returns (string memory) { 
        return "Z";
    }

    function bar() override(X, Y)  public  pure returns (string memory) {
        return "Z";
    }

}