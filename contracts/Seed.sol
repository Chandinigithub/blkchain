// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Seed {
    uint256 barCode;

    constructor(uint256 _barCode) {
        barCode = _barCode;
    }
}
