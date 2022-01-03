// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Distributor.sol";
import "./Produce.sol";


contract DistributorPurchase {
    uint256 barCode;
    uint256 executedDate;
    Distributor distributor;
    Produce produce;
    uint256[] temprature;
    uint256[] humidity;

    constructor(Distributor _distributor, Produce _produce) {
        distributor = _distributor;
        produce = _produce;
        executedDate = block.timestamp;
    }

    function getBarCode() public view returns (uint256) {
        return barCode;
    }

    function setTemprature(uint256 _day, uint256 _temp) public {
        temprature[_day] = _temp;
    }

    function setHumidity(uint256 _day, uint256 _humidity) public {
        humidity[_day] = _humidity;
    }    
}
