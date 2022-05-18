require('@nomiclabs/hardhat-waffle');
require('@nomiclabs/hardhat-etherscan');
require('dotenv').config();

const { RINKEBY_API_URL, PRIVATE_KEY, ETHERSCAN_KEY } = process.env;

module.exports = {
  solidity: '0.8.4',
  networks: {
    rinkeby: {
      url: RINKEBY_API_URL,
      accounts: [`0x${PRIVATE_KEY}`],
    },
  },
  etherscan: {
    apiKey: ETHERSCAN_KEY,
  },
};
