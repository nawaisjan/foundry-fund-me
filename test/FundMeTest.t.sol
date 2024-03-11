// SPDX-License-Identifier: MIT
// 1. Pragma
pragma solidity ^0.8.19;

import {Test ,console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
  FundMe fundMe ;

  function setUp() external {

    DeployFundMe deployFundMe = new DeployFundMe();
    fundMe = deployFundMe.run();
    
    
  }

  function testMinimumDollarIsFive()public{
    assertEq(fundMe.MINIMUM_USD(), 5e18);
  }

  function testOwnerIsMsgSender() public {
    // console.log(fundMe.i_owner());
    // console.log(address(this));
    assertEq(fundMe.i_owner(), msg.sender);
  }

  function testGetPriceIsAccurate() public {
    uint256 version = fundMe.getVersion();
    assertEq(version, 4);
    
  }

  

}