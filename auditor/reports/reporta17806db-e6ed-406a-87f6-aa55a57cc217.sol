pragma solidity ^0.8.0;

contract EthGame {
    uint256 public targetAmount = 28 ether;
    address public winner;
    uint256 public balance;

    function deposit() public payable {
        require(msg.value == 2 ether, "You can only send 2 Ethers");
        balance += msg.value;
        require(balance <= targetAmount, "Game is over");
        if (balance == targetAmount) {
            winner = msg.sender;
        }
    }

    function claimTheReward() private {
        require(msg.sender == winner, "NOT a winner");
        (bool sent, ) = msg.sender.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
    }

    function getTheBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
