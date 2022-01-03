// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Seed.sol";
import "./Soil.sol";
import "./Fertilizer.sol";
import "./Pesticide.sol";

contract Produce {
    ProduceDetails produceDetails;
    address private owner = msg.sender;
    uint256 _DAYS = 366;
    bool greenHouse;
    uint256 public harvestdate;
    uint256 barCode;

    struct ProduceDetails {
        Seed seedType;
        string season;
        uint256[] temprature;
        uint256[] humidity;
        SoilDetail[] soilDetail;
        FertilizerDetail[] fertilizerDetail;
        PesticideDetail[] pesticideDetail;
    }

    struct FertilizerDetail {
        uint256 barCode;
        uint256 quantity;
        uint256 day;
        uint256 cost;
    }

    struct PesticideDetail {
        uint256 barCode;
        uint256 quantity;
        uint256 day;
        uint256 cost;
    }

    struct SoilDetail {
        uint256 barCode;
        uint256 quantity;
        uint256 day;
        uint256 cost;
    }

    constructor(Seed _seedType, string memory _season, bool _greenHouse) {
        produceDetails.seedType = _seedType;
        produceDetails.season = _season;
        produceDetails.temprature = new uint256[](_DAYS);
        produceDetails.humidity = new uint256[](_DAYS);
        greenHouse = _greenHouse;
    }

    function getProduceDetails() public view returns (ProduceDetails memory) {
        return produceDetails;
    }

    function setTemprature(uint256 _day, uint256 _temp) public {
        produceDetails.temprature[_day] = _temp;
    }

    function setHumidity(uint256 _day, uint256 humidity) public {
        produceDetails.humidity[_day] = humidity;
    }

    function harvest() public {
        harvestdate = block.timestamp;
    }

    function setSoil(
        uint256 _day,
        Soil _soil,
        uint256 _qty,
        uint256 _cost
    ) public {
        SoilDetail memory soilDetails;
        soilDetails.quantity = _qty;
        soilDetails.barCode = _soil.getBarCode();
        soilDetails.day = _day;
        soilDetails.cost = _cost;
        produceDetails.soilDetail.push(soilDetails);
    }

    function getSoil(uint256 _day) public view returns (string memory) {
        return
            string(
                abi.encodePacked(
                    produceDetails.soilDetail[_day].barCode,
                    produceDetails.soilDetail[_day].quantity
                )
            );
    }

    function setFertilizer(
        uint256 _day,
        Fertilizer _fertilizer,
        uint256 _qty,
        uint256 _cost
    ) public {
        FertilizerDetail memory fertilizerDetail;
        fertilizerDetail.quantity = _qty;
        fertilizerDetail.barCode = _fertilizer.getBarCode();
        fertilizerDetail.day = _day;
        fertilizerDetail.cost = _cost;
        produceDetails.fertilizerDetail.push(fertilizerDetail);
    }

    function setPesticide(
        uint256 _day,
        Pesticide _pesticide,
        uint256 _qty,
        uint256 _cost
    ) public {
        PesticideDetail memory pesticideDetail;
        pesticideDetail.quantity = _qty;
        pesticideDetail.barCode = _pesticide.getBarCode();
        pesticideDetail.day = _day;
        pesticideDetail.cost = _cost;
        produceDetails.pesticideDetail.push(pesticideDetail);
    }
}
