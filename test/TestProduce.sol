// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Produce.sol";

contract TestAdoption {
    function testTemp() public {
        Produce produce = Produce(DeployedAddresses.Produce());

        produce.setTemprature(1, 12);
        Assert.equal(
            produce.getProduceDetails().temprature[1],
            12,
            "1a failed"
        );
    }

    // function testSoil() public {
    //     Produce produce = Produce(DeployedAddresses.Produce());
    //     Soil soil = Soil(DeployedAddresses.Soil());

    //     produce.setSoil(1, soil,1);
    //     // Assert.equal(
    //     //     produce.getSoil(1),
    //     //     "1",
    //     //     "1a failed"
    //     // );
    // }
}
