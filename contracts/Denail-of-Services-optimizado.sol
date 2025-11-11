// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract DenialServiceOptimizado {
    uint256 constant MAX_INTERATIONS = 100;

    function performDos(uint256 _iterations) pure public {
        require(_iterations<= MAX_INTERATIONS, "excedio el maximo de transcciones");
        for(uint256 i = 0; i < _iterations; i++){
            uint256[] memory data = new uint256[](_iterations);
            for(uint256 j = 0; j < _iterations; j++){
                data[j] = j;
            }
        }
    }
}