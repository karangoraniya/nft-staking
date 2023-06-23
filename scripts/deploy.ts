import { ethers } from 'hardhat';
async function main() {
  const NappyToken = await ethers.getContractFactory('NappyToken');
  const nappyToken = await NappyToken.deploy();

  await nappyToken.deployed();

  console.log('NappyToken deployed to:', nappyToken.address);

  const NFTMint = await ethers.getContractFactory('NFTMint');
  const nftMint = await NFTMint.deploy();

  await nftMint.deployed();

  console.log('NFTMint deployed to:', nftMint.address);

  const Staking = await ethers.getContractFactory('Staking');
  const staking = await Staking.deploy(nappyToken.address, nftMint.address);

  await staking.deployed();

  console.log('Staking deployed to:', staking.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
