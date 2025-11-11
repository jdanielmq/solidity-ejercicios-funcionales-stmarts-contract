// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract OverflowUnderflowExample {

    function overflowExample(uint8 _val) public pure returns (uint8) {
        uint8 maxValue = 255;
        maxValue += _val;
        return maxValue;
    }
    function underflowExample( uint8 _val) public pure returns (uint8) {
        uint8 minValue = 255;
        minValue -= _val;
        return minValue;
    }
}