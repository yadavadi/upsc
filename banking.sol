// SPDX-License-Identifier:MIT
pragma solidity ^0.6;

contract Banking{
    mapping(address=>uint)public user_account;
    mapping(address=>bool)public user_exists;

    function create_account()public payable returns(string memory){
        require(user_exists[msg.sender]==false,"account already exists");
        if(msg.value==0){
            user_account[msg.sender]=0;
            user_exists[msg.sender]=true;
        }
        user_account[msg.sender]=msg.value;
        user_exists[msg.sender]=true;
        return ("account created");
    }
    function deposit(uint amount)public payable returns(string memory){
        require(user_exists[msg.sender]==true,"account doesnt exist");
        require(amount>0,"amount should be greater than zero");
        user_account[msg.sender]=user_account[msg.sender]+amount;
        return ("deposited successfully");
    }
    function withdraw(uint amount)public payable returns(string memory){
        require(user_exists[msg.sender]==true,"account does not exist");
        require(amount>0,"amount should be greater than zero");
        require(user_account[msg.sender]>amount,"not enough balance");
        user_account[msg.sender]=user_account[msg.sender]-amount;
        return("withdraw successfully");
    }        
    function balance()public view returns(uint){
        return user_account[msg.sender];
    }
    function account_exist() public view returns(bool){
        return user_exists[msg.sender];
    }
}
