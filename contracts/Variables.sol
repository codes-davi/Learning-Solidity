// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Variables{

    //variavel de estado
    string public mensagem = "Ola mundo!"; 

    //pode ser inicializada fora do construtor
    string public constant GREETING = "My name is Davi Sousa";

    //precisa ser inicializada dentro do construtor
    address public immutable OWNER;

    constructor () {
        //endereço de quem enviou o contrato para a blockchain
        OWNER = msg.sender;
    }

    //metodos que retornam variavel de estado tem a palavra especial "view"
    function retornaMensagem() public view returns (string memory){
        return mensagem;
    }

    //metodo que retorna variavel local tem a palavra especial "pure"
    function sayHi() public pure returns (string memory){
        //variavel local
        string memory text = "Hiiii my friend!";
        return text;
    }

}