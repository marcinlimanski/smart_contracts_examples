//SPDX-License-Identifier: UNLICENSED

// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract StorageExample {
    uint storedData = 0;

    function set(uint x) public {
        storedData = x;
    }

    function getBalance() public view returns (uint) {
        return storedData;
    }
}