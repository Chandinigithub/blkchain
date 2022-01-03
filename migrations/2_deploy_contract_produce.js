const Produce = artifacts.require("Produce");
const Seed = artifacts.require("Seed");

module.exports = function(deployer) {
  //deployer.deploy(Produce,1,"Summer");
  //deployer.deploy(Seed,"Carrot");

  deployer.deploy(Seed,1).then(async () => {
    // get JS instance of deployed contract
    const c2instance = await Seed.deployed(); 
    // pass its address as argument for Contract1's constructor
    await deployer.deploy(Produce, c2instance.address,"Summer",false); 
  });
};