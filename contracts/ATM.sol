//SDPX-License-Identifier: MIT

pragma solidity ^0.5.13;

contract ATM{
    
    mapping(address => uint) public accountsBalance;

    function getBalance() public view returns (uint){
        return address(this).balance;
    }

    function sendMoney() public payable{
        accountsBalance[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _recipient, uint _amount) public{
        require(accountsBalance[msg.sender] >= _amount, "Not enough funds");
        accountsBalance[msg.sender] -= _amount;
        _recipient.transfer(_amount);
    }

    function withdrawAllMoney(address payable _recipient) public {

        uint balanceToSend = accountsBalance[msg.sender];

        //check effects interactions pattern where the transfer of money is the last to occur
        accountsBalance[msg.sender] = 0;
        // always the interaction comes last
        _recipient.transfer(balanceToSend);
    }

}
