pragma solidity ^0.5.0;

import "./DaiToken.sol";
import "./DappToken.sol";

contract FarmToken {
    string public name = "Dapp Token Farm";
    DaiToken public daiToken;
    DappToken public dappToken;

    address[] public stakers;
    mapping(address => uint) public stakingBalance;
    mapping(address => bool) public hasStaked;
    mapping(address => bool) public currentStakingStatus;


    constructor(DappToken _dappToken, DaiToken _daiToken) public {
        daiToken = _daiToken;
        dappToken = _dappToken;
    }

    function stakeTokens(uint _amount) public {
        //Transfer DAI token to our digital bank
        daiToken.transferFrom(msg.sender, address(this), _amount);

        //Update staking balance
        stakingBalance[msg.sender] =  stakingBalance[msg.sender] + _amount;

        if(!hasStaked[msg.sender]){
            stakers.push(msg.sender);
        }

        currentStakingStatus[msg.sender] = true;
        hasStaked[msg.sender] = true;
    }
}
