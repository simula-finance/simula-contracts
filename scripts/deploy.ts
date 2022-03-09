import { ethers } from "hardhat";

async function main() {

  // Deploy Simulacrum 
  const simulacraContract = await ethers.getContractFactory("Simulacrum");
  const simulacra = await simulacraContract.deploy();
  await simulacra.initialize();

  // Deploy HYPR
  const hyprContract = await ethers.getContractFactory("HYPER");
  const hypr = await hyprContract.deploy();
  await hypr.initialize();


  

}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
