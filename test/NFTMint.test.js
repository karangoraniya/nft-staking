const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('NFTMint', function () {
  it("Should return the new greeting once it's changed", async function () {
    const NFTMint = await ethers.getContractFactory('NFTMint');
    const nftMint = await NFTMint.deploy();
    await nftMint.deployed();
  });
});
