// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract RamdomnessVulnerable {
    uint private seed;
    uint public  randomNumber;

    constructor() {
        seed = block.timestamp;
    }

    function generateRandonNumber() public  {
        randomNumber = uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, seed)));
    }
}