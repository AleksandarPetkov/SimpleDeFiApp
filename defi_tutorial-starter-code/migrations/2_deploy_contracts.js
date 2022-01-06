const FarmToken = artifacts.require('FarmToken');
const DappToken = artifacts.require('DappToken');
const DaiToken = artifacts.require('DaiToken');


//Puts all of the Smart-Contracts on the Block-Chain
module.exports = async function (deployer, network, accounts) {
  //Deploy Dapp Token
  await deployer.deploy(DappToken);
  const dappToken = await DappToken.deployed();

  //Deploy Mock Dai Token
  await deployer.deploy(DaiToken);
  const daiToken = await DaiToken.deployed();

  //Deploy Farm Token
  await deployer.deploy(FarmToken, dappToken.address, daiToken.address);
  const farmToken = await FarmToken.deployed();

  //Transferr all Tokens to Farm Token
  await dappToken.transfer(farmToken.address, '1000000000000000000000000');
  
  //Transferr Mock Dai Token to Investor
  await daiToken.transfer(accounts[1], '1000000000000000000000000');
};