const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('EtherRequirement', function () {
    let EtherRequirement;
    let etherRequirement;
    let owner;
    let user;

    before(async function () {
        // Deploy the contract
        [owner, user] = await ethers.getSigners();
        EtherRequirement = await ethers.getContractFactory('EtherRequirement');
        etherRequirement = await EtherRequirement.deploy(ethers.parseEther('1'));
        await etherRequirement.deploymentTransaction();
    });

    it('should have the correct required amount', async function () {
        const requiredAmount = await etherRequirement.requiredAmount();
        expect(requiredAmount).to.equal(ethers.parseEther('1'));
    });



    it('should revert when performing action with incorrect amount of Ether', async function () {
        await expect(etherRequirement.connect(user).performAction({ value: ethers.parseEther('0.5') })
    ).to.be.revertedWith('Exact amount of Ether required');
    });
});