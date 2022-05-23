const { expect } = require('chai');
const { BigNumber } = require('ethers');
const { ethers } = require('hardhat');

describe('NappyToken', function () {
  it('Should return the correct symbol', async function () {
    const NappyToken = await ethers.getContractFactory('NappyToken');
    const nappyToken = await NappyToken.deploy();
    await nappyToken.deployed();

    expect(await nappyToken.symbol()).to.equal('NPY');
  });

  it('Should return the correct name', async function () {
    const NappyToken = await ethers.getContractFactory('NappyToken');
    const nappyToken = await NappyToken.deploy();
    await nappyToken.deployed();

    expect(await nappyToken.name()).to.equal('NappyToken');
  });
});
