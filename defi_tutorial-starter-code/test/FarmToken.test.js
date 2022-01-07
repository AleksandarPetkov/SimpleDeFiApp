const FarmToken = artifacts.require('FarmToken');
const DappToken = artifacts.require('DappToken');
const DaiToken = artifacts.require('DaiToken');

require('chai')
   .use(require('chai-as-promised'))
   .should();

contract('FarmToken', (accounts) => {

   describe('Mock DAI deployment', async () => {
      it('has a name', async () => {
         let daiToken = await DaiToken.new();
         const name = await daiToken.name()
         assert.equal(name, 'Mock DAI Token')
      })
   })
   
})