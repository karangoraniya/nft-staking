# NFT Staking Smart Contract

A comprehensive NFT staking platform built with Foundry, featuring ERC1155 NFTs and ERC20 reward tokens with time-based APR rewards.

## 🚀 Features

- **ERC1155 NFT Staking**: Stake multiple NFTs with different amounts
- **ERC20 Reward System**: Earn NPY tokens based on staking duration
- **Time-based APR**: Progressive reward rates for longer staking periods
- **Built with Foundry**: Modern development environment with fast testing

## 📊 Reward Structure

| Staking Duration  | APR Rate | Reward Token |
| :---------------- | :------- | :----------- |
| Less than 1 month | `0%`     | NPY          |
| 1-6 months        | `5%`     | NPY          |
| 6-12 months       | `10%`    | NPY          |
| After 12 months   | `15%`    | NPY          |

## 📋 Smart Contracts

### NappyToken (ERC20)

- **Symbol**: NPY
- **Name**: NappyToken
- **Features**: Mintable, Ownable, ERC20Permit

### NFTMint (ERC1155)

- **Standard**: ERC1155
- **Features**: Mintable, Burnable, Ownable
- **Metadata**: IPFS-hosted images

### Staking Contract

- **Core Function**: NFT staking with time-based rewards
- **Reward Calculation**: `(Rate × Time × Amount × 10^18) / (Month × 12 × 100)`
- **Features**: Stake/Unstake NFTs, automatic reward distribution

## 🛠️ Installation & Setup

### Prerequisites

- [Foundry](https://getfoundry.sh/introduction/installation/)

### Clone Repository

```
git clone git@github.com:karangoraniya/nft-staking.git
cd nft-staking
```

### Install Dependencies

```bash
forge install
```

### Install OpenZeppelin Contracts

```bash
forge install OpenZeppelin/openzeppelin-contracts
```

## 🔧 Development

### Compile Contracts

```bash
forge build
```

### Run Tests

```bash
# Run all tests
forge test

# Run with verbose output
forge test -vv

# Run specific test file
forge test --match-path test/Staking.t.sol

# Run with gas reporting
forge test --gas-report
```

### Code Formatting

```bash
# Format all Solidity files
forge fmt

# Check formatting without making changes
forge fmt --check
```

### Gas Snapshots

```bash
# Create gas usage snapshots for optimization
forge snapshot

# Compare gas usage with previous snapshot
forge snapshot --diff
```

### Test Coverage

```bash
forge coverage
```

### Local Development Node

```bash
# Start local Ethereum node (like Ganache)
anvil

# Start with specific port
anvil --port 8545

# Start with specific accounts
anvil --accounts 10
```

### Smart Contract Interaction (Cast)

```bash
# Get contract balance
cast balance <address>

# Call contract function
cast call <contract_address> "balanceOf(address)" <user_address>

# Send transaction
cast send <contract_address> "mint(address,uint256)" <to_address> <amount> --private-key <key>

# Get transaction receipt
cast receipt <tx_hash>

# Convert values
cast to-wei 1 ether
cast from-wei 1000000000000000000
```

## 📝 Deployment

### Local Deployment

```bash
# Start local node
anvil

# Deploy contracts (in separate terminal)
forge script script/NappyToken.s.sol --rpc-url http://localhost:8545 --broadcast --private-key <anvil_private_key>

forge script script/NFTMint.s.sol --rpc-url http://localhost:8545 --broadcast --private-key <anvil_private_key>

forge script script/Staking.s.sol --rpc-url http://localhost:8545 --broadcast --private-key <anvil_private_key>
```

### Testnet Deployment

#### Environment Setup

Create a `.env` file in the root directory:

```bash
# Private Keys
PRIVATE_KEY=YOUR_PRIVATE_KEY
SENDER_ADDRESS=YOUR_WALLET_ADDRESS

# RPC URLs
ETH_HOLESKY_RPC_URL=ETH_HOLESKY_RPC
BASE_SEPOLIA_RPC_URL=BASE_SEPOLIA__RPC

# API Keys for Verification, For all network
ETHERSCAN_API_KEY=ETHERSCAN_API_KEY
```

**Load environment variables:**

```bash
source .env
```

**Or use Foundry's built-in env loading:**

#### Deploy to Base Sepolia Testnet

```bash
# Foundry automatically loads .env file


forge script script/Staking.s.sol \
    --rpc-url $BASE_SEPOLIA_RPC_URL \
    --broadcast \
    --verify \
    --sender $SENDER_ADDRESS \
    --private-key $PRIVATE_KEY \
    --etherscan-api-key $ETHERSCAN_API_KEY
```

#### Deploy to Holesky Testnet

```bash
forge script script/Staking.s.sol \
    --rpc-url $ETH_HOLESKY_RPC_URL \
    --broadcast \
    --verify \
    --sender $SENDER_ADDRESS \
    --private-key $PRIVATE_KEY \
    --etherscan-api-key $ETHERSCAN_API_KEY
```

### Contract Verification

#### Automatic Verification (Recommended)

When deploying, use the `--verify` flag for automatic verification:

```bash
forge script script/Staking.s.sol \
    --rpc-url $ETH_HOLESKY_RPC_URL \
    --broadcast \
    --verify \
    --etherscan-api-key $ETHERSCAN_API_KEY \
    --private-key $PRIVATE_KEY
```

#### Manual Verification

If you deployed without `--verify`, you can verify contracts manually:

**Verify NappyToken:**

```bash
forge verify-contract <NAPPY_TOKEN_ADDRESS> \
    src/NappyToken.sol:NappyToken \
    --chain-id 17000 \
    --constructor-args $(cast abi-encode "constructor(address)" "<INITIAL_OWNER_ADDRESS>") \
    --etherscan-api-key $ETHERSCAN_API_KEY \
    --watch
```

**Verify NFTMint:**

```bash
forge verify-contract <NFT_MINT_ADDRESS> \
    src/NFTMint.sol:NFTMint \
    --chain-id 17000 \
    --constructor-args $(cast abi-encode "constructor(address)" "<INITIAL_OWNER_ADDRESS>") \
    --etherscan-api-key $ETHERSCAN_API_KEY \
    --watch
```

**Verify Staking:**

```bash
forge verify-contract <STAKING_ADDRESS> \
    src/Staking.sol:Staking \
    --chain-id 17000 \
    --constructor-args $(cast abi-encode "constructor(address,address)" "<TOKEN_ADDRESS>" "<NFT_ADDRESS>") \
    --etherscan-api-key $ETHERSCAN_API_KEY \
    --watch
```

#### Chain IDs for Verification

- **Holesky Testnet**: `17000`
- **Base Sepolia**: `84532`

#### Check Verification Status

```bash
forge verify-check --chain-id 17000 <GUID> $ETHERSCAN_API_KEY
```

### Deployed Contracts

#### Holesky Testnet

- **NappyToken**: [0x149fA8e35149E1E287827B047F01F79D724f28Fa](https://holesky.etherscan.io/address/0x149fA8e35149E1E287827B047F01F79D724f28Fa)
- **NFTMint**: [0xE993643D43477EF5be7ff3EfAdAb7cbfAbc1B35f](https://holesky.etherscan.io/address/0xE993643D43477EF5be7ff3EfAdAb7cbfAbc1B35f)
- **Staking**: [0x8f42244d2c622Fd97e199BD81063Fa143AE07C5d](https://holesky.etherscan.io/address/0x8f42244d2c622Fd97e199BD81063Fa143AE07C5d)

#### Base Sepolia Testnet

- **NappyToken**: [0xe733d6D6FE687665257cfF03E31CB54BD67e2367](https://sepolia.basescan.org/address/0xe733d6D6FE687665257cfF03E31CB54BD67e2367)
- **NFTMint**: [0xe627DC5c2a89d26055CF48bDdb6525E9d8B47CbD](https://sepolia.basescan.org/address/0xe627DC5c2a89d26055CF48bDdb6525E9d8B47CbD)
- **Staking**: [0x223769226732eBb9C6B263d7Bf3bEf44fE59E72E](https://sepolia.basescan.org/address/0x223769226732eBb9C6B263d7Bf3bEf44fE59E72E)

## 🧪 Testing

### Test Structure

```
test/
├── NappyToken.t.sol    # ERC20 token tests
├── NFTMint.t.sol       # ERC1155 NFT tests
└── Staking.t.sol       # Staking functionality tests
```

### Test Coverage

- ✅ Token creation and minting
- ✅ NFT minting and transfers
- ✅ Staking mechanics
- ✅ Reward calculations
- ✅ Time-based rate changes
- ✅ Access control

## 📁 Project Structure

```
├── src/
│   ├── NappyToken.sol      # ERC20 reward token
│   ├── NFTMint.sol         # ERC1155 NFT contract
│   └── Staking.sol         # Main staking contract
├── script/
│   ├── NappyToken.s.sol    # Token deployment script
│   ├── NFTMint.s.sol       # NFT deployment script
│   └── Staking.s.sol       # Staking deployment script
├── test/
│   ├── NappyToken.t.sol    # Token tests
│   ├── NFTMint.t.sol       # NFT tests
│   └── Staking.t.sol       # Staking tests
├── lib/                    # Dependencies
├── foundry.toml           # Foundry configuration
└── README.md
```

## 🎯 Usage

### For Users

1. **Get NPY Tokens**: Mint NPY tokens (owner only)
2. **Get NFTs**: Mint ERC1155 NFTs (owner only)
3. **Approve Staking**: Approve the staking contract to transfer your NFTs
4. **Stake NFTs**: Call `stakeNFT(tokenId, amount)`
5. **Wait & Earn**: Earn progressively higher APR based on staking duration
6. **Unstake**: Call `unStakeNFT(tokenId, amount)` to get NFTs back + rewards

### For Developers

## 🚨 Important Notes

- Rewards are calculated based on the time elapsed since staking
- Minimum 1 month staking required for any rewards
- Progressive APR encourages longer-term staking
- Contract owner must fund the staking contract with NPY tokens for rewards

## 🔗 Useful Links

- [Foundry Documentation](https://book.getfoundry.sh/)
- [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts/)
- [Holesky Faucet](https://cloud.google.com/application/web3/faucet/ethereum/holesky)
- [Holesky Faucet](https://www.alchemy.com/faucets/ethereum-holesky)
- [Base Sepolia Faucet](https://www.alchemy.com/faucets/base-sepolia)

## 🆘 Help & Troubleshooting

### Get Help

```bash
# General Foundry help
forge --help

# Anvil help
anvil --help

# Cast help
cast --help

# Chisel help
chisel --help

# Specific command help
forge test --help
forge script --help
```

### Common Issues

**Build Errors:**

```bash
# Clean cache and rebuild
forge clean
forge build
```

**Test Failures:**

```bash
# Run tests with maximum verbosity to see details
forge test -vvvv

# Run specific failing test
forge test --match-test testFunctionName -vvv
```

**Deployment Issues:**

```bash
# Verify RPC URL is correct
cast chain-id --rpc-url <your_rpc_url>

# Check account balance
cast balance <your_address> --rpc-url <your_rpc_url>
```

## 📄 License

This project is licensed under the GPL-3.0 License.

## 👨‍💻 Author

**Karan J Goraniya**

---
