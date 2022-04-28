//SDPX-License-Identifier: MIT
pragma solidity ^0.5.13;

contract StartStopUpdateExample{

    address public owner;

    bool public paused;

    //called only once when the contract is deployed
    constructor() public {
        owner = msg.sender;
    }

    function setPaused(bool _paused) public{
        require(msg.sender == owner, "Command not allowed");
        paused = _paused;
    }

    function destroySmartContract(address payable _to) public{
        require(msg.sender == owner, "You can't do it");
        selfdestruct(_to);
    }

    function receiveMoney() public payable{}

    function showFunds() public view returns (uint){
        return address(this).balance;
    }
    
    function sendMoney(address payable _to) public{
        require(msg.sender == owner, "Command not allowed");
        require(!paused, "Contract is paused");
        _to.transfer(address(this).balance);
    }
}
