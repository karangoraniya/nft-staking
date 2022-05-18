const hre = require('hardhat');

async function main() {
  const NappyToken = await hre.ethers.getContractFactory('NappyToken');
  const nappyToken = await NappyToken.deploy();

  await nappyToken.deployed();

  console.log('NappyToken deployed to:', nappyToken.address);

  const NFTMint = await hre.ethers.getContractFactory('NFTMint');
  const nftMint = await NFTMint.deploy();

  await nftMint.deployed();

  console.log('NFTMint deployed to:', nftMint.address);

  const Staking = await hre.ethers.getContractFactory('Staking');
  const staking = await Staking.deploy();

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
