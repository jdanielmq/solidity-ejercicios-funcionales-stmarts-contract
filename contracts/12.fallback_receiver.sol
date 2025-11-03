// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract FallbackReceive {
    fallback() external payable { } 

    receive() external payable { }
}