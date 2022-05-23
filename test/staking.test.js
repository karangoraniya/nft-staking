const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('Staking', () => {
  let NappyToken;
  let nappyToken;
  let NFTMint;
  let nftMint;
  let Staking;
  let staking;
  let addr1;
  let addr2;
  let owner;

  beforeEach(async () => {
    [owner, addr1, addr2] = await ethers.getSigners();
    NappyToken = await ethers.getContractFactory('NappyToken');
    nappyToken = await NappyToken.deploy();
    await nappyToken.deployed();
    nappyTokenAddress = nappyToken.address;

    // NFt
    NFTMint = await ethers.getContractFactory('NFTMint');
    nftMint = await NFTMint.deploy();
    await nftMint.deployed();
    nftMintAddress = nftMint.address;

    // Staking
    Staking = await ethers.getContractFactory('Staking');
    staking = await Staking.deploy(nappyTokenAddress, nftMintAddress);
    await staking.deployed();
    stakingAddress = staking.address;
  });

  it('Should mint the reward token ', async () => {
    await nappyToken.mint(stakingAddress, 1000000000);
    expect(await nappyToken.balanceOf(stakingAddress)).to.equal(
      ethers.utils.parseUnits('1000000000', 18)
    );
  });

  it('Should stake the NFT', async () => {
    await nftMint.mint(addr1.address, 1, 2444, 0x00);
    await nftMint.connect(addr1).setApprovalForAll(stakingAddress, true);
    await staking.connect(addr1).stakeNFT(1, 2444);
    const stakingInfo = await staking.stakes(addr1.address);
    expect(stakingInfo.tokenId).to.equal(1);
    expect(stakingInfo.amount).to.equal(2444);
  });

  it('Should unStake the NFT', async () => {
    await nftMint.mint(addr1.address, 1, 2444, 0x00);
    await nftMint.connect(addr1).setApprovalForAll(stakingAddress, true);
    await staking.connect(addr1).stakeNFT(1, 2444);
    await staking.connect(addr1).unStakeNFT(1, 2444);
    expect(await nappyToken.balanceOf(addr1.address)).to.equal(0);
  });

  it('Should unStake the NFT after 2 month', async () => {
    await nappyToken.mint(stakingAddress, 1000000000);
    await nftMint.mint(addr1.address, 1, 2444, 0x00);
    await nftMint.connect(addr1).setApprovalForAll(stakingAddress, true);
    await staking.connect(addr1).stakeNFT(1, 2444);
    await ethers.provider.send('evm_increaseTime', [2 * 2629743]);
    await staking.connect(addr1).unStakeNFT(1, 2444);
    expect(await nappyToken.balanceOf(addr1.address)).to.not.equal(0);
  });
});
