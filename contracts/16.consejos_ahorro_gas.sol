// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;


contract GasRefactor {
    uint public total;
    // [1,4,10,50,77,100]
    function sumar(uint[] calldata nums) external {
        uint _total = total;
        uint len =  nums.length;
        for (uint i = 0; i < len; ++i){
            uint num = nums[i];
            if(num % 2 == 0 && num < 99){
                _total += num;
            }
        }
        total = _total;
    }
}