//SPDX-License-Identifier: MIT
pragma solidity ^0.5.13;

contract Remembering{
    address public OWNER;

    mapping(address => uint) public balanceOwners;

    constructor() public{
        OWNER = msg.sender;
    }

    function depositPersonalFunds() public payable{
        balanceOwners[msg.sender] += msg.value; 
    }

    function getPersonalFunds() public view returns(uint){
        return balanceOwners[msg.sender];
    }

    function withdrawPersonalMoney(uint _amount) public{
        require(balanceOwners[msg.sender] >= _amount, "Not enough funds.");
        balanceOwners[msg.sender] -= _amount;
        msg.sender.transfer(_amount);
    }

    function showContractFunds() public view returns(uint){
        return address(this).balance;
    }
}
