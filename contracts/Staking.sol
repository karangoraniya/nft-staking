// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

// @title NFT Staking 
/// @author Karan J Goraniya
/// @notice You can use this contract for only the most basic simulation
/// @dev All function calls are currently implemented without side effects

contract Staking is ERC1155Holder {

    IERC1155 public NFTItem;
    using SafeERC20 for IERC20;
    IERC20 private token;
    uint256 private totalTokens;

    uint256 month = 2629743;
    uint256 constant deno = 100;

    struct Staker {
        uint256 tokenId;
        uint256 amount;
        uint256 timestamp;
    }

    mapping(address => Staker) public stakes;

    constructor(address _token,address _NFTItem) {
        token = IERC20(_token);
        NFTItem = IERC1155(_NFTItem);
    }

    event Stake(address indexed owner, uint256 id, uint256 amount, uint256 time);
    event UnStake(address indexed owner, uint256 id, uint256 amount, uint256 time, uint256 rewardTokens);


    // @notice It will calculate the rate of the token reward
    // @dev It will block.timestamp to track the time.
    // @return Return the reward rate %


    function calculateRate() private view returns(uint8) {
        uint256 time = stakes[msg.sender].timestamp;
        if(block.timestamp - time < month) {
            return 0;
        } else if(block.timestamp - time <  month * 6 ) {
            return 5;
        } else if(block.timestamp - time < 12 * month) {
            return 10;
        } else {
            return 15;
        }
    }

    // @notice It will give user to stake the NFT.
    // @dev It will confirm the you have enough NFT to stake.
    // @param It will take Token Id of NFT & Amount.

    function stakeNFT(uint256 _tokenId, uint256 _amount) public {
        require(NFTItem.balanceOf(msg.sender, _tokenId) >= _amount,'you dont have enough balance');
        stakes[msg.sender] = Staker(_tokenId, _amount, block.timestamp);
        NFTItem.safeTransferFrom(msg.sender, address(this), _tokenId, _amount, "0x00");
        emit Stake (msg.sender, _tokenId, _amount, block.timestamp);
    }

    // @notice It will unstake the NFT and distribute the token reward.
    // @dev It will calculate the reward with calculateRate() and distribute token using IERC20.
    // @param It will take Token Id of NFT & Amount.
    // Reward amount = Staked Amount * Reward Rate * TimeDiff / RewardInterval

    function unStakeNFT(uint256 _tokenId, uint256 _amount) public {
        stakes[msg.sender].amount -= _amount;
        NFTItem.safeTransferFrom( address(this), msg.sender, _tokenId, _amount, "0x00");

        uint256 time = block.timestamp - stakes[msg.sender].timestamp;
        uint256 reward =  calculateRate() * time * _amount * 10 ** 18 / month * 12 * deno ;

        token.safeTransfer( msg.sender, reward);

        emit UnStake(msg.sender, _tokenId, _amount,  block.timestamp, reward);
    }

}