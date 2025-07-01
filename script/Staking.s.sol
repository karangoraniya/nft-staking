// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.27;

import {Script, console} from "forge-std/Script.sol";
import {Staking} from "../src/Staking.sol";
import {NappyToken} from "../src/NappyToken.sol";
import {NFTMint} from "../src/NFTMint.sol";

contract StakingScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        
        // Deploy NappyToken first
        NappyToken token = new NappyToken(msg.sender);
        console.log("NappyToken deployed at:", address(token));
        
        // Deploy NFTMint
        NFTMint nft = new NFTMint(msg.sender);
        console.log("NFTMint deployed at:", address(nft));
        
        // Deploy Staking with token and nft addresses
        Staking staking = new Staking(address(token), address(nft));
        console.log("Staking deployed at:", address(staking));
        
        vm.stopBroadcast();
    }
}