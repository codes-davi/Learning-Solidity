// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <=0.8.0;

/// @title HelloWorld
/// @author Davi Sousa
/// @notice Lotery contract

contract HelloWorld {
    string public message = "Hello World";

    function greet() public view returns (string memory){
        return message;
    }
}