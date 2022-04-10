// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    // default privacy set as private when not declared
    address immutable OWNER;
    address[] public players;

    uint256 count;

    constructor() {
        OWNER = msg.sender;
    }

    // payable means function can be called passing ethers
    // ether depends on base coin of the blockchain network,
    // ethereum is ether, binance is bnb, but all use the special word "ether"
    function join() public payable {
        require(msg.value == 0.1 ether, "Invalid amount");
        players.push(msg.sender);
    }

    function getPlayers() public view returns (address[] memory) {
        return players;
    }

    function random() private view returns (uint256) {
        // keccack256 encode parameters
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        block.timestamp,
                        block.difficulty,
                        players,
                        count
                    )
                )
            );
    }

    function pickWinner() public onlyOwner returns (address payable){
        address payable winner = payable(players[random() % players.length]);

        winner.transfer(address(this).balance);

        players = new address[](0);

        count = count + 1;

        return winner;
    }

    // modifier = middlewares
    modifier onlyOwner() {
        require(OWNER == msg.sender, "Owner required");
        // _; to keep execution
        _;
    }
}
