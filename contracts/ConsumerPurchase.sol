// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


import "./Produce.sol";
import "./Consumer.sol";

contract ConsumerPurchase {
    uint256 barCode;
    uint256 executedDate;
    Consumer consumer;
    Produce produce;
    uint256[] temprature;
    uint256[] humidity;

    constructor(Consumer _consumer, Produce _produce) {
        consumer = _consumer;
        produce = _produce;
        executedDate = block.timestamp;
    }

    function getBarCode() public view returns (uint256) {
        return barCode;
    }

  
}
