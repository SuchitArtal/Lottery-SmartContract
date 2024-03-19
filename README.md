# Lottery Smart Contract

This is a smart contract implemented in Solidity for a simple lottery system. Players can participate by sending 1 ether to the contract, and a winner is randomly chosen among the participants when the manager triggers the `pickWinner()` function.

## Contract Details

### Entities
- **Manager**: The address that deployed the contract and manages the lottery.
- **Players**: Addresses of participants who joined the lottery by sending 1 ether.
- **Winner**: The address of the participant randomly chosen as the winner.

### Functions
1. **Constructor**: Initializes the manager as the address of the contract creator.
2. **participate()**: Allows players to participate in the lottery by sending 1 ether. Their address is added to the list of players.
3. **getBalance()**: Retrieves the current balance of the contract. Only the manager can call this function.
4. **random()**: Internal function used to generate a pseudo-random number based on block difficulty, timestamp, and the number of players.
5. **pickWinner()**: Manager-only function to pick a winner randomly among the players when there are at least 3 participants. The chosen winner receives the entire contract balance.

## SPDX-License-Identifier

This smart contract is licensed under the MIT License. For details, refer to the SPDX-License-Identifier included at the beginning of the code.

## Usage

To utilize this smart contract, follow these steps:

1. Deploy the contract.
2. Participants can join the lottery by calling the `participate()` function and sending 1 ether.
3. Once there are at least 3 participants, the manager can call `pickWinner()` to select a random winner.
4. The chosen winner will receive the entire balance of the contract.

**Note**: Ensure that your environment supports Solidity version `0.7.0` to `0.9.0`.

## Disclaimer

This contract is provided as an educational example and for demonstration purposes only. It has not been audited for security. Use it at your own risk.
