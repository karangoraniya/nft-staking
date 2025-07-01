// SPDX-License-Identifier: MIT

pragma solidity ^0.8.27;

import {Test} from "forge-std/Test.sol";
import {NappyToken} from "../src/NappyToken.sol";

contract NappyTokenTest is Test {
    NappyToken public nappyToken;
    address public owner;

    function setUp() public {
        owner = makeAddr("owner");
        vm.prank(owner);
        nappyToken = new NappyToken(owner);
    }

    function testShouldReturnTheCorrectSymbol() public view {
        assertEq(nappyToken.symbol(), "NPY");
    }

    function testShouldReturnTheCorrectName() public view {
        assertEq(nappyToken.name(), "NappyToken");
    }
}