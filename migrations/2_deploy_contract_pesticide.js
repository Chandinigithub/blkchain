const Fertilizer = artifacts.require("Fertilizer");


module.exports = function(deployer) {
  deployer.deploy(Fertilizer,1);

};