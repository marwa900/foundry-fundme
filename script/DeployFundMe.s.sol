// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function setUp() public {}

    function run() external returns (FundMe) {
        //Before startBroad.. -> not a real trans
     HelperConfig helperConfig = new HelperConfig();
    ( address ethUsdPriceFeed) = helperConfig.activeNetworkConfig();

        vm.startBroadcast();
         //after startBroad.. -> real trans
       FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
