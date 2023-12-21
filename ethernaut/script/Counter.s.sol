// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Attack, Telephone} from "../src/Telephone/telephone.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public returns (Attack) {
        vm.startBroadcast();
        Attack swi = new Attack(
            Telephone(0x795803DEa61B7cd15ECBb3CFFAbbf59395Eaaa75)
        );
        vm.stopBroadcast();
        return swi;
    }
}
