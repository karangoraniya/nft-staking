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
    API_URL = "https://eth-ropsten.alchemyapi.io/v2/your-api-key"
    PRIVATE_KEY = "YOUR-METAMASK-PRIVATE_KEY"
    ETHERSCAN_API_KEY = "YOUR-ETHERSCAN_API_KEY"

```

-Get Your API Key

- [Alchemy](https://alchemy.com/?r=36af7883c4699196)

-Get Your Rinkeby Faucet

- [Rinkeby Faucet](https://faucets.chain.link/rinkeby)

## NPM Packages

- [Openzeppelin](https://www.npmjs.com/package/@openzeppelin/contracts)
- [Hardhat-Ethers](https://www.npmjs.com/package/hardhat-ethers)
- [Chai](https://www.npmjs.com/package/chai)
- [Ethers](https://www.npmjs.com/package/ethers)
- [Ethereum-Waffle](https://www.npmjs.com/package/ethereum-waffle)
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
  git clone https://github.com/karangorania/vesting-smart-contract
```

Go to the project directory

```bash
  cd vesting-smart-contract
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

Deploy

```bash
  node scripts/deploy.js
```

Deploy on Rinkeby

```bash
  npx hardhat run scripts/deploy.js --network rinkeby
```

Verify Contract

```bash
npx hardhat verify --network rinkeby <YOUR_CONTRACT_ADDRESS>
```

Help

```bash
  npx hardhat help
```

## Check on Rinkeby Explorer

- [NappyToken](https://rinkeby.etherscan.io/address/0x89939c7Caf1F850a467bd145772aF5B733C34C2e)
- [NFTMint](https://rinkeby.etherscan.io/address/0x3C87Df4552730a0Cd2E38A703106e3A83f9Fe37f)
- [Staking](https://rinkeby.etherscan.io/address/0x22f9b3f98E3210a723e944015Ed6D779f0a1AA6c)
