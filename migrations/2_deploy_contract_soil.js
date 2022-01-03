const Soil = artifacts.require("Soil");


module.exports = function(deployer) {
  deployer.deploy(Soil,1);

};