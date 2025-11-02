// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract IterableMapping {
    mapping (address => uint) public balances;
    mapping (address => bool) public inserted;
    address[] public keys;

    function set(address _key, uint _value) external {
        balances[_key] = _value;

        if(!inserted[_key]){
            inserted[_key] = true;
            keys.push(_key);
        } 
    }

    function getSize() external view returns (uint) {
        return keys.length;
    }

    function first() external view returns (uint) {
        return balances[keys[0]];
    }

    function last() external view returns (uint) {
        return balances[keys[keys.length - 1]];
    }

    function get(uint _i) external view returns (uint) {
        return balances[keys[_i]];
    }

    function getKeyAtIndex(uint _index) external view returns (address) {
        return keys[_index];
    }

    function getKeys() external view returns (address[] memory) {
        return keys;
    }
}