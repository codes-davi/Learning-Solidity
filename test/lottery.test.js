const { assert } = require('console');

const Lottery = artifacts.require('Lottery');

contract('Lottery', ([accA, accB, AccD])=>{
    beforeEach(async ()=>{
        contract = await Lottery.new(); //Lottery.deploy() caso estivesse associada a uma blockchain 
    });

    it('Assert first account is the owner', async ()=>{
        const OwnerAddress = await contract.OWNER(); //variável imutável, mas sendo usada como função
        assert(OwnerAddress === accA, 'Needs to be equal');
    });

    it('Assert players list is empty', async ()=>{
        const players = await contract.getPlayers();
        assert(players.length === 0, 'Players list needs to be empty');
    });

    it('Assert balance is empty', async ()=>{
        const contractAddress = await contract.address;
        const balance = await web3.eth.getBalance(contractAddress);
        const etherBalance = web3.utils.fromWei(balance, 'ether');
        
        assert(parseInt(etherBalance) === 0);
    });
    
});