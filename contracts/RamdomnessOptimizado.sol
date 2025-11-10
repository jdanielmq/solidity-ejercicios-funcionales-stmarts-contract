// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

interface RamdomnessOracle {
    function getRandomNumber() external returns (uint);
}

contract RamdomnessOptimizado {
    uint public  randomNumber;
    address private oracle;

    constructor(address _oracleAddress) {
        oracle = _oracleAddress;
    }

    function generateRandonNumber() public  {
        require(oracle != address(0), "Oracle address no set");

        randomNumber = RamdomnessOracle(oracle).getRandomNumber();
    }
}