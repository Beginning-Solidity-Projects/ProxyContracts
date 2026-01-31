// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract Zoo1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 internal numberVisitors;

    constructor() {
    _disableInitializers();
    }

    function getVisitors() external view returns (uint256) {
        return numberVisitors;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade (address newImplementation) view internal override onlyOwner {
        require(newImplementation != address(0), "Invalid address");
    }

    function initialize() public initializer {
        __Ownable_init(msg.sender);
    }
}


contract Zoo2 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 internal numberVisitors;

    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __Ownable_init(msg.sender);
    }

    function setNumberVisitors(uint256 newVisitors) external {
        numberVisitors = newVisitors;
    }

    function getVisitors() external view returns (uint256) {
        return numberVisitors;
    }

    function version() external pure returns (uint256) {
        return 2;
    }

    function _authorizeUpgrade (address newImplementation) view internal override onlyOwner {
        require(newImplementation != address(0), "Invalid address");
    }
}


