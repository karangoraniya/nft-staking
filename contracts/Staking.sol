// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract Staking {

    IERC1155 public NFTItem;

    constructor(address _NFTItem) {
        NFTItem = IERC1155(_NFTItem);
    }

    struct Stake {
        uint256 tokenId;
        uint256 amount;
        uint256 timestamp;
    }

    mapping(address => Stake) public stakes;

    // staking total time
    mapping(address => uint256) public stakingTime;

    function stakeNFt(uint256 _tokenId, uint256 _amount) public {
        stakes[msg.sender] = Stake(_tokenId, _amount, block.timestamp);
        NFTItem.safeTransferFrom(msg.sender, address(this), _tokenId, _amount, "0x00");
    }


    function unStakeNFt() public {
        NFTItem.safeTransferFrom( address(this), msg.sender, stakes[msg.sender].tokenId, stakes[msg.sender].amount, "0x00");
        stakingTime[msg.sender] += (block.timestamp - stakes[msg.sender].timestamp);
        delete stakes[msg.sender];
    }
}