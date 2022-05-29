//SPDX-License-Identifier: MIT
pragma solidity ^0.5.13;

contract MappingStructExample{

    struct Payment{
        uint amount;
        uint timestamps;
    }

    struct Balance{
        uint totalBalance;
        uint numPayments;
        mapping(uint => Payment) payments;
    }

    address public OWNER;

    mapping(address => Balance) public balanceOwners;

    constructor() public{
        OWNER = msg.sender;
    }

    function depositPersonalFunds() public payable{
        balanceOwners[msg.sender].totalBalance += msg.value;

        Payment memory payment = Payment(msg.value, now);

        balanceOwners[msg.sender].payments[balanceOwners[msg.sender].numPayments] = payment;
        balanceOwners[msg.sender].numPayments++;
    }

    function getPersonalFunds() public view returns(uint){
        return balanceOwners[msg.sender].totalBalance;
    }

    function withdrawPersonalMoney(uint _amount) public{
        require(balanceOwners[msg.sender].totalBalance >= _amount, "Not enough funds.");
        balanceOwners[msg.sender].totalBalance -= _amount;
        msg.sender.transfer(_amount);
    }

    function showContractFunds() public view returns(uint){
        return address(this).balance;
    }
}
