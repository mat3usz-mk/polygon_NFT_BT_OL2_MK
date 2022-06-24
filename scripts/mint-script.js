const hre = require("hardhat");
async function main() {
  const NFT = await hre.ethers.getContractFactory("MyNFT");
  const URI = "ipfs://QmVbisqjQkU7zUUXbxKCgtEzZKECbh35ZirzH8fk9E2a5h"
  const WALLET_ADDRESS = "0x99741FA366A11bC2FEBD49BF8D55eaAE7e38AEc4"
  const CONTRACT_ADDRESS = "0x8f0eD4fFCe28202E07dE33F7e6aB6c18d615342A"
  const contract = NFT.attach(CONTRACT_ADDRESS);
  await contract.mint(WALLET_ADDRESS, URI);
  console.log("NFT minted:", contract);
}
main().then(() => process.exit(0)).catch(error => {
  console.error(error);
  process.exit(1);
});