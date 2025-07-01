// SPDX-License-Identifier: MIT

pragma solidity ^0.8.27;

import {Test} from "forge-std/Test.sol";
import {NFTMint} from "../src/NFTMint.sol";

contract NFTMintTest is Test {
    NFTMint public nft;
    address public owner;

    function setUp() public {
        owner = makeAddr("owner");
        vm.prank(owner);
        nft = new NFTMint(owner);
    }

    function testOwnerIsSetCorrectly() public view {
        assertEq(nft.owner(), owner);
    }

    
}