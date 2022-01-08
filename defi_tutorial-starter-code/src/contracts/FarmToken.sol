pragma solidity ^0.5.0;

import "./DaiToken.sol";
import "./DappToken.sol";

contract FarmToken {
    string public name = "Dapp Token Farm";
    address public owner;
    DaiToken public daiToken;
    DappToken public dappToken;

    address[] public stakers;
    mapping(address => uint) public stakingBalance;
    mapping(address => bool) public hasStaked;
    mapping(address => bool) public currentStakingStatus;


    constructor(DappToken _dappToken, DaiToken _daiToken) public {
        daiToken = _daiToken;
        dappToken = _dappToken;
        owner = msg.sender;
    }

    function stakeTokens(uint _amount) public {
        require(_amount > 0, "amount cannot be 0");

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

    function receiveDappTokenInterest() public {
        require(msg.sender == owner, "Only owner can send interest");

        for(uint i = 0 ; i < stakers.length ; i++){
            address recipient = stakers[i];
            uint balance = stakingBalance[recipient];
            
            // Send dappToken as interest, which is equal amout of deposed DAI token
            if(balance > 0){
                dappToken.transfer(recipient, balance);
            }         
        }
    }
}
