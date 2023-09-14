// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GameSave {
    struct GameData {
        uint256[] playerCards;
        uint256[] dealerCards;
        uint256 playerScore;
        uint256 dealerScore;
    }

    // Mapping to associate wallet addresses with game data
    mapping(address => GameData) public gameData;

    // Function to set the game data for the caller's wallet address
    function setGameData(
        uint256[] memory _playerCards,
        uint256[] memory _dealerCards,
        uint256 _playerScore,
        uint256 _dealerScore
    ) public {
        gameData[msg.sender] = GameData({
            playerCards: _playerCards,
            dealerCards: _dealerCards,
            playerScore: _playerScore,
            dealerScore: _dealerScore
        });
    }

    // Function to retrieve the game data for the caller's wallet address
    function getGameData() public view returns (
        uint256[] memory playerCards,
        uint256[] memory dealerCards,
        uint256 playerScore,
        uint256 dealerScore
    ) {
        GameData storage data = gameData[msg.sender];
        playerCards = data.playerCards;
        dealerCards = data.dealerCards;
        playerScore = data.playerScore;
        dealerScore = data.dealerScore;
    }
}
