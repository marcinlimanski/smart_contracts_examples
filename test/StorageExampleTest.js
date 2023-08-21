const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Token contract", function () {
    it("Check Storage amount", async function () {
        const [owner] = await ethers.getSigners();
        const hardhatStorage = await ethers.deployContract("StorageExample");


        const storageBalance = await hardhatStorage.getBalance()
        expect(await storageBalance).to.equal(0);
    });

    it("Set Storage amount", async function () {
        const [owner] = await ethers.getSigners();
        const hardhatStorage = await ethers.deployContract("StorageExample");

        const newValue = 3

        await hardhatStorage.set(newValue)
        const storageBalance = await hardhatStorage.getBalance()
        expect(await storageBalance).to.equal(newValue);
    });
});
