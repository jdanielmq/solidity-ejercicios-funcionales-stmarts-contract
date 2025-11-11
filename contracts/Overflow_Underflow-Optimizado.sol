// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {SafeMath} from './SafeMath.sol';

contract OverflowUnderflowExample {
    using SafeMath for uint8;

    function overflowExample(uint8 _val) public pure returns (uint8) {
        uint8 maxValue = 255;
        maxValue = uint8(maxValue.add(_val));
        return maxValue;
    }
    function underflowExample(uint8 _val) public pure returns (uint8) {
        uint8 minValue = 255;
        minValue = uint8(minValue.sub(_val));
        return minValue;
    }
}