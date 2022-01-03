// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Soil {
    uint256 barCode;

    constructor(uint256 _barCode) {
        barCode = _barCode;
    }

    function getBarCode() public view returns (uint256) {
        return barCode;
    }
}
