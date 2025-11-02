// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract ControlAcceso {
    event AsignarRole(bytes32 indexed role, address indexed account);
    event RevocarRole(bytes32 indexed role, address indexed account);


    // role => account => bool
    mapping(bytes32 => mapping(address => bool)) public _roles;

    // hash Admin - hash user - hash guest
    bytes32 private constant ADMIN = keccak256(abi.encodePacked("ADMIN")); // 0xdf8b4c520ffe197c5343c6f5aec59570151ef9a492f2c624fd45ddde6135ec42
    bytes32 private constant USER = keccak256(abi.encodePacked("USER")); // 0x2db9fd3d099848027c2383d0a083396f6c41510d7acfd92adc99b6cffcf31e96
    bytes32 private constant GUEST = keccak256(abi.encodePacked("GUEST")); //0xb298fa9636e9050fbd8ff56bd93a3fca017e3e18b3a30f173dee3380c98765ca

    modifier onlyAdmin(bytes32 _role) {
        require(_roles[_role][msg.sender], "No tienes permisos de administrador");
        _;
    }

    constructor(){
        _asignarRole(ADMIN, msg.sender);
    }

    function _asignarRole(bytes32 _role, address _account) internal {
        _roles[_role][_account] = true;
        emit AsignarRole(_role, _account);
    }
    
    function _revocarRole(bytes32 _role, address _account) internal {
        _roles[_role][_account] = false;
        emit RevocarRole(_role, _account);
    }

    function asignarRole(bytes32 _role, address _account) external onlyAdmin(ADMIN) {
        _asignarRole(_role, _account);
    }       
    
    function asignarRevocar(bytes32 _role, address _account) external onlyAdmin(ADMIN) {
        _revocarRole(_role, _account);
    }  
}