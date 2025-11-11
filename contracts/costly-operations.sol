// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract CostlyOperationsVulnerable {
    uint256 constant public MAX_ITERATIONS = 1600;

    function performCostlyOperations() pure external returns(uint256 result){
        result = 0;
        for(uint256 i = 0; i<MAX_ITERATIONS; i++){
            result +=1;
        }
    }
}