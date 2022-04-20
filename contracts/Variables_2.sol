//SPDX-License-Identifier: MIT
pragma solidity ^0.5.13;

contract Variables{
    uint256 public myInt;
    bool public myBool;
    uint8 public myUint8;
    address public myAddress;

    //dynamically sized byte arrays
    string public myString = "Hello homies";

    function setMyInt(uint _myUint) public{
        myInt = _myUint;
    }

    function setMyBool(bool _myBool) public{
        myBool = _myBool;
    }

    function changeBool() public{
        myBool = !myBool;
    }

    function incrementUint() public{
        myUint8++;
    }

    function deincrementUint() public{
        myUint8--;
    }

    function setAddress(address _myAddress) public{
        myAddress = _myAddress;
    }

    function getBalance() public view returns (uint){
        return myAddress.balance;
    }

    function setMyString(string memory _myString) public{
        myString = _myString;
    }

    function power(uint16 base, uint8 exp) public pure returns (uint256){
        uint total = base**exp;
        return total;
    }
}
