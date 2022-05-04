//SDPX-License-Identifier: MIT
pragma solidity ^0.5.13;

contract SimpleMappingExample{
    
    mapping(uint8 => bool) public myMapping;

    mapping(address => bool) public mappingAddress;

    function setValue(uint8 _index) public{
        myMapping[_index] = true;
    }

    function setAddressAsTruthy() public{
        mappingAddress[msg.sender] = true;
    }
    
    //not related to the topic "mapping"
    function randomFunc(uint8 _num) public pure returns(bool){
        if(_num > 15 && _num < 55){
            return true;
        }
    }
}
