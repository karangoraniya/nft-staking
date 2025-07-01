// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.27;

import {Test} from "forge-std/Test.sol";
import {NappyToken} from "../src/NappyToken.sol";
import {NFTMint} from "../src/NFTMint.sol";
import {Staking} from "../src/Staking.sol";

contract StakingTest is Test {
    NappyToken public nappyToken;
    NFTMint public nftMint;
    Staking public staking;
    
    address public owner;
    address public addr1;
    address public addr2;

    function setUp() public {
        owner = makeAddr("owner");
        addr1 = makeAddr("addr1");
        addr2 = makeAddr("addr2");

        // Deploy NappyToken
        vm.prank(owner);
        nappyToken = new NappyToken(owner);

        // Deploy NFTMint
        vm.prank(owner);
        nftMint = new NFTMint(owner);

        // Deploy Staking
        staking = new Staking(address(nappyToken), address(nftMint));
    }

    function testShouldStakeTheNFT() public {
        // Mint NFT to addr1
        vm.prank(owner);
        nftMint.mint(addr1, 1, 2444, "");

        // Approve staking contract
        vm.prank(addr1);
        nftMint.setApprovalForAll(address(staking), true);

        // Stake NFT
        vm.prank(addr1);
        staking.stakeNFT(1, 2444);

        // Check staking info
        (uint256 tokenId, uint256 amount, uint256 timestamp) = staking.stakes(addr1);
        assertEq(tokenId, 1);
        assertEq(amount, 2444);
        assertTrue(timestamp > 0);
    }

    function testShouldUnStakeTheNFT() public {
        // Mint NFT to addr1
        vm.prank(owner);
        nftMint.mint(addr1, 1, 2444, "");

        // Approve staking contract
        vm.prank(addr1);
        nftMint.setApprovalForAll(address(staking), true);

        // Stake NFT
        vm.prank(addr1);
        staking.stakeNFT(1, 2444);

        // Unstake NFT
        vm.prank(addr1);
        staking.unStakeNFT(1, 2444);

        // Check balance (should be 0 as no time passed)
        assertEq(nappyToken.balanceOf(addr1), 0);
    }

    function testShouldUnStakeTheNFTAfter2Month() public {
        // Mint tokens to staking contract
        vm.prank(owner);
        nappyToken.mint(address(staking), 100000000000000000000000000000);

        // Mint NFT to addr1
        vm.prank(owner);
        nftMint.mint(addr1, 1, 2444, "");

        // Approve staking contract
        vm.prank(addr1);
        nftMint.setApprovalForAll(address(staking), true);

        // Stake NFT
        vm.prank(addr1);
        staking.stakeNFT(1, 2444);

        // Increase time by 2 months
        vm.warp(block.timestamp + 2 * 2629743);

        // Unstake NFT
        vm.prank(addr1);
        staking.unStakeNFT(1, 2444);

        // Check balance (should not be 0 as time passed)
        assertTrue(nappyToken.balanceOf(addr1) != 0);
    }
}