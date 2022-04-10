// SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0 <= 0.8.0;

contract Primitives{
    
    bool public booleano = true;
    
    //não existe tipo decimal, u = sempre positivos, sem o u, aceita negativos
    uint8 public u8 = 1; //até 256-1
    uint256 public u256 = 50000;
    int8 public i8 = -77;

    //obter menor e maior valor
    int256 public minInt = type(int256).min;
    int256 public maxInt = type(int256).max;

    //guardar endereço
    address public addr = 0x43773106b3194986C006E6785FD8b844cf3c76c3;

    //variaveis sem atribuição tem valores padrões
    bool public dafaultBool; //false
    uint104 public defaultUint; //0
    address public defaultAddr;

    function maxNum() public view returns(int256 num){
        return maxInt;
    }

    function minNum() public view returns (int256 num){
        return minInt;
    }

}