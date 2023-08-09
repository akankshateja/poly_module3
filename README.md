# Circuit Implementation
The main circuit is defined in the circuit.circom file. The circuit consists of three basic gates (AND, OR, and NOT) and a template named Multiplier2. The circuit logic for Multiplier2 is as follows:

It takes two input signals, a and b. It calculates the logical AND of a and b using the AND component and stores the result in signal x. It computes the logical NOT of signal b using the NOT component and stores the result in signal y. It calculates the logical OR of signals x and y using the OR component and stores the result in signal Q. The value of signal Q is logged to the console.

# Install
npm i

# Compile
npx hardhat circom This will generate the out file with circuit intermediaries and geneate the MultiplierVerifier.sol contract

# To prove you know the inputs A (0) & B (1) that yield Q=0 as output.
Inside your input.json file paste { "a": "0", "b": "1" }

# Prove and Deploy
npx hardhat run scripts/deploy.ts This script does 4 things

Deploys the MultiplierVerifier.sol contract
Generates a proof from circuit intermediaries with generateProof()
Generates calldata with generateCallData()
Calls verifyProof() on the verifier contract with calldata
# Deployment to Polygon Mumbai Network
follow the steps:

Create a .env file
add you account address private key which is on Polygon mumbai testnet and has test matics.
inside your hardhat.config.ts file add the following  networks:{   mumbai: { url :`https://polygon-mumbai.g.alchemy.com/v2/xYD2bZsKa0S4r-a6-UcCkGOPdyCRhZXe` ,   accounts: [process.env.POLYGONMUMBAIPRIVATEKEY]  } }, NOTE : url can be an rpc url or your api address.
import dotenv/config.
Now run the following command in your Terminal npx hardhat run scripts/deploy.ts --network mumbai This will compile the solidity file, along with the following output Verifier deployed to "address" Q : 0 Verifier result: true
# Author
AKANKSHA TEJA
