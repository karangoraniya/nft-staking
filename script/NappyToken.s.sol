// SPDX-License-Identifier: MIT

pragma solidity ^0.8.27;

import {Script, console} from "forge-std/Script.sol";
import {NappyToken} from "../src/NappyToken.sol";

contract NappyTokenScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        
        NappyToken token = new NappyToken(msg.sender);
        console.log("NappyToken deployed at:", address(token));
        
        vm.stopBroadcast();
    }
}