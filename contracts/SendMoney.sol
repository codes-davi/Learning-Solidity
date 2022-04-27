//SDPX-License-Identifier: MIT
pragma solidity ^0.5.13;

contract SendMoney{

    uint public balanceReceived;

    //payable only when receives any amount of ether
    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    // "this" word refers to the contract
    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function getAddress() public view returns(address){
        return address(this);
    }

    function withdrawMoney() public {
        address payable recipient = msg.sender;
        //amount in wei
        // may use this.getBalance()
        recipient.transfer(getBalance());
    }

    function withdrawMoneyTo(address payable _to) public {
        _to.transfer(getBalance());
    }
}
