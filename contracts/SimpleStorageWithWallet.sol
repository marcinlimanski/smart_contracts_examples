// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    // Declare a mapping to store numbers for different wallet addresses
    mapping(address => uint256) private userNumbers;

    // Function to set a number for the caller's wallet address
    function setNumber(uint256 _number) public {
        userNumbers[msg.sender] = _number;
    }

    // Function to get the number stored for the caller's wallet address
    function getNumber() public view returns (uint256) {
        return userNumbers[msg.sender];
    }

    // Function to get the number stored for a specific wallet address
    function getNumberForAddress(address _user) public view returns (uint256) {
        return userNumbers[_user];
    }
}