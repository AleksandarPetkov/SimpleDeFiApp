pragma solidity ^0.5.0;

import "./DaiToken.sol";
import "./DappToken.sol";

contract FarmToken {
    string public name = "Dapp Token Farm";
    DaiToken public daiToken;
    DappToken public dappToken;

    constructor(DappToken _dappToken, DaiToken _daiToken) public {
        daiToken = _daiToken;
        dappToken = _dappToken;
    }
}
