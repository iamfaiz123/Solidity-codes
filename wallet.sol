// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract wallet{
 
 address payable public owner;

 constructor(){
     owner = payable(msg.sender);
 }

 receive() payable external {}

 function  checkBalance()view public returns(uint){
     require(msg.sender == owner, "Not owner of the wallet");
     return address(this).balance;
 }

 function withDraw(uint _amount)payable public {
    require(msg.sender == owner, "Not owner of the wallet");
    require(_amount< address(this).balance ,"Not enough fund");
    (bool success, ) =  owner.call{value:_amount}(" ");
    require(success, " fail to transfer eth");
 }
 
function sendEther(address payable _to, uint _amount)payable public{
    require(msg.sender == owner, "Not owner of the wallet");
    require(_amount< address(this).balance ,"Not enough fund");
    (bool success, ) = _to.call{value:_amount}(" ");
    require(success, " fail to transfer eth");

  }

}


