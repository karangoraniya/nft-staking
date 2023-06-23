import { expect } from 'chai';
import { ethers } from 'hardhat';
import { Contract, Signer } from 'ethers';

describe('Staking', () => {
  let NappyToken: Contract;
  let nappyToken: Contract;
  let NFTMint: Contract;
  let nftMint: Contract;
  let Staking: Contract;
  let staking: Contract;
  let addr1: Signer;
  let addr2: Signer;
  let owner: Signer;

  beforeEach(async () => {
    [owner, addr1, addr2] = await ethers.getSigners();
    const NappyToken = await ethers.getContractFactory('NappyToken');
    nappyToken = await NappyToken.deploy();
    await nappyToken.deployed();

    console.log(nappyToken);

    let nappyTokenAddress = nappyToken.address;

    // NFT
    const NFTMint = await ethers.getContractFactory('NFTMint');
    nftMint = await NFTMint.deploy();
    await nftMint.deployed();
    let nftMintAddress = nftMint.address;

    // Staking
    const Staking = await ethers.getContractFactory('Staking');
    staking = await Staking.deploy(nappyTokenAddress, nftMintAddress);
    await staking.deployed();
    let stakingAddress = staking.address;
  });

  it('Should stake the NFT', async () => {
    await nftMint.mint(addr1.getAddress(), 1, 2444, '0x00');
    await nftMint.connect(addr1).setApprovalForAll(staking.address, true);
    await staking.connect(addr1).stakeNFT(1, 2444);
    const stakingInfo = await staking.stakes(addr1.getAddress());
    expect(stakingInfo.tokenId).to.equal(1);
    expect(stakingInfo.amount).to.equal(2444);
  });

  it('Should unStake the NFT', async () => {
    await nftMint.mint(addr1.getAddress(), 1, 2444, '0x00');
    await nftMint.connect(addr1).setApprovalForAll(staking.address, true);
    await staking.connect(addr1).stakeNFT(1, 2444);
    await staking.connect(addr1).unStakeNFT(1, 2444);
    expect(await nappyToken.balanceOf(addr1.getAddress())).to.equal(0);
  });

  it('Should unStake the NFT after 2 month', async () => {
    await nappyToken.mint(staking.address, 1000000000);
    await nftMint.mint(addr1.getAddress(), 1, 2444, '0x00');
    await nftMint.connect(addr1).setApprovalForAll(staking.address, true);
    await staking.connect(addr1).stakeNFT(1, 2444);
    await ethers.provider.send('evm_increaseTime', [2 * 2629743]);
    await staking.connect(addr1).unStakeNFT(1, 2444);
    expect(await nappyToken.balanceOf(addr1.getAddress())).to.not.equal(0);
  });
});
