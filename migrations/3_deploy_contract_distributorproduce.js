const Produce = artifacts.require("Produce");
const Distributor = artifacts.require("Distributor");
const DistributorPurchase = artifacts.require("DistributorPurchase");

module.exports = async function (deployer) {

  const distributorInstance = await Distributor.deployed();
  const produceInstance =  await Produce.deployed();
  deployer.deploy(DistributorPurchase, distributorInstance.address, produceInstance.address);
};