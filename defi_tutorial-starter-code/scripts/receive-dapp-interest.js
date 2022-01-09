const FarmToken = artifacts.require('FarmToken');

module.exports = async function (callback) {
    let tokenFarm = await FarmToken.deployed();
    await tokenFarm.receiveDappTokenInterest();

    console.log('Check Interest receive script');
    callback();
};
