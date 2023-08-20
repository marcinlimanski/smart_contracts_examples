pragma solidity ^0.8.0;

contract EtherRequirement {
    address public owner;
    uint256 public requiredAmount;

    constructor(uint256 _requiredAmount) {
        owner = msg.sender;
        requiredAmount = _requiredAmount;
    }

    modifier requireExactAmount() {
        require(msg.value == requiredAmount, "Exact amount of Ether required");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function setRequiredAmount(uint256 _newAmount) public onlyOwner {
        requiredAmount = _newAmount;
    }

    function performAction() public payable requireExactAmount {
        // Send a "Hello" message to the sender
        (bool success, ) = msg.sender.call{ value: 0 }("");
        require(success, "Failed to send Ether");

        emit ActionPerformed(msg.sender, msg.value);
    }

    event ActionPerformed(address indexed performer, uint256 value);
}