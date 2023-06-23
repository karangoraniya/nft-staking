# NFT-Staking-Smart-Contract

NFT-Staking Smart Contract for 1 month, 6months, and 12 months.

## Vesting

#### Get all Tokens Details

| Duration     | APR Reward % | Reward Tokens |
| :----------- | :----------- | :------------ |
| 01 Month     | `05`         | NPY           |
| 06 Months    | `10`         | NPY           |
| 12 Months    | `15`         | NPY           |
| After 1 Year | `15`         | NPY           |

## Important Step

```bash
create .env file in root directory.
```

```bash
    PRIVATE_KEY="YOUR_PRIVATE_KEY"
    ETHERSCAN_API_KEY="YOUR_ETHERSCAN_API_KEY"
    POLYGON_SCAN_API_KEY="YOUR_POLYGON_SCAN_API_KEY"

```

-Get Your API Key

- [Alchemy](https://alchemy.com/?r=36af7883c4699196)

-Get Your Sepolia Faucet

- [Sepolia Faucet](https://sepoliafaucet.com/)

-Get Your Mumbai Faucet

- [Mumbai Faucet](https://mumbaifaucet.com/)

## NPM Packages

- [Openzeppelin](https://www.npmjs.com/package/@openzeppelin/contracts)
- [Hardhat-Ethers](https://www.npmjs.com/package/hardhat-ethers)
- [Chai](https://www.npmjs.com/package/chai)
- [Ethers](https://www.npmjs.com/package/ethers)
- [Dotenv](https://www.npmjs.com/package/dotenv)
- [Hardhat-Etherscan](https://www.npmjs.com/package/hardhat-etherscan)

## Tech Stack

- [Node](https://nodejs.org/en/)
- [Hardhat](https://hardhat.org/)
- [Solidity](https://docs.soliditylang.org/)
- [Openzeppelin](https://openzeppelin.com/)

## Run Locally

Clone the project

```bash
  git clone git@github.com:karangorania/nft-staking.git
```

Go to the project directory

```bash
  cd nft-staking
```

Install dependencies

```bash
  npm install
```

Compile

```bash
  npx hardhat compile
```

Test

```bash
  npx hardhat test
```

Deploy on Mumbai

```bash
  node scripts/deploy.js --network mumbai
```

Deploy on Sepolia

```bash
  npx hardhat run scripts/deploy.js --network sepolia
```

Verify Contract

You can verify your contract on the desired network using the npx hardhat verify command. Replace <YOUR_CONTRACT_ADDRESS> with the address of the contract you want to verify. If your contract requires constructor arguments, replace <WITH_ARGUMENT_IF_REQUIRED> with those arguments. Note that providing constructor arguments is optional and only necessary if your contract requires them.

For the Mumbai network:

```bash
npx hardhat verify --network mumbai <YOUR_CONTRACT_ADDRESS> <WITH_ARGUMENT_IF_REQUIRED>
```

For the Sepolia network:

```bash
npx hardhat verify --network sepolia <YOUR_CONTRACT_ADDRESS> <WITH_ARGUMENT_IF_REQUIRED>
```

Help

```bash
  npx hardhat help
```

## Check on Mumbai Explorer

- [NappyToken](https://mumbai.polygonscan.com/address/0x05924dee097369652961ceba659a0346eb57fd50)
- [NFTMint](https://mumbai.polygonscan.com/address/0x71649508590948ada22a07be87bd5bb8096bf1b1)
- [Staking](https://mumbai.polygonscan.com/address/0x1e9528464acaab88ea636ab32ce73be4d55ba50d)

## Check on Rinkeby Explorer

- [NappyToken](https://sepolia.etherscan.io/address/0xd50aac05b95bcffb658265da522bdba94d1fd1e3)
- [NFTMint](https://sepolia.etherscan.io/address/0xe733d6d6fe687665257cff03e31cb54bd67e2367)
- [Staking](https://sepolia.etherscan.io/address/0xe627dc5c2a89d26055cf48bddb6525e9d8b47cbd)
