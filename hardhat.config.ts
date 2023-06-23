import { HardhatUserConfig } from 'hardhat/config';
import '@nomicfoundation/hardhat-toolbox';
require('dotenv').config();

const { PRIVATE_KEY, POLYGON_SCAN_API_KEY, ETHERSCAN_API_KEY } = process.env;

const config: HardhatUserConfig = {
  solidity: '0.8.18',
  networks: {
    mumbai: {
      url: 'https://rpc.ankr.com/polygon_mumbai',
      accounts: [`0x${PRIVATE_KEY}`],
    },
    sepolia: {
      url: 'https://rpc.ankr.com/eth_sepolia',
      accounts: [`0x${PRIVATE_KEY}`],
    },
  },
  etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
};

export default config;
