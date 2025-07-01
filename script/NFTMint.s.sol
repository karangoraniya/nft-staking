// SPDX-License-Identifier: MIT

pragma solidity ^0.8.27;

import {Script, console} from "forge-std/Script.sol";
import {NFTMint} from "../src/NFTMint.sol";

contract NFTMintScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        
        NFTMint nft = new NFTMint(msg.sender);
        console.log("NFTMint deployed at:", address(nft));
        
        vm.stopBroadcast();
    }
}