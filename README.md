# CustomToken: A Smart Contract for Mintable and Burnable Tokens on the Ethereum Blockchain

The CustomToken project is a Solidity-based smart contract designed for the Ethereum blockchain. It facilitates the creation and management of a custom cryptocurrency with features for minting and burning tokens. The contract defines a token with a specific name ("Treasure Coin") and symbol ("TSC"). It includes mechanisms to increase the total supply through the `generate` function and to decrease it using the `destroy` function. This project is ideal for learning the basics of token management and exploring how events can log significant actions, ensuring transparency and enabling interactions with off-chain applications.

## Description

The CustomToken smart contract initializes with public variables that store essential details about the token, such as its name, abbreviation, and total supply. A mapping structure is used to keep track of each address's token balance. The contract's functionality revolves around two main operations: minting new tokens, which increases the total supply and updates the recipient's balance, and burning tokens, which reduces the total supply and decreases the holder's balance, provided they have sufficient tokens. Events are emitted during these operations to facilitate transparency and enable external systems to monitor and react to these changes.

## Program Execution

### Setup Environment:

1. Utilize Remix Ethereum IDE or a local development setup with tools like Truffle or Hardhat.
2. Ensure you have an Ethereum client, such as MetaMask, configured for deployment and interaction with the contract.

### Deploy the Contract:

1. Open Remix and create a new file named `CustomToken.sol`.
2. Copy the provided contract code into this file.
3. Compile the contract using Solidity compiler version 0.8.18.
4. Deploy the contract through the Remix interface. The deployment does not require any constructor parameters.

### Interact with the Contract:

1. Use the `generate` function to mint new tokens to a specified address.
2. Use the `destroy` function to burn tokens from a specified address, ensuring sufficient balance.
3. Check the balances and total supply after each operation.
4. Monitor emitted events to track these actions.

## Explanation

### Solidity Version and License

The contract begins with a license identifier and specifies the Solidity version to ensure compatibility and legal clarity.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
```

### Contract Declaration

The CustomToken contract is declared with public variables for storing the token's details.

```solidity
contract CustomToken {
    string public name = "Treasure Coin";      // Token Name
    string public symbol = "TSC";              // Token Abbreviation
    uint public totalTokens = 0;               // Total Supply
```

### Mapping for Balances

The contract includes a mapping to maintain the balance of each address holding the tokens.

```solidity
    mapping(address => uint) public tokenBalances;
```

### Events for Logging

Events are defined to log token generation and destruction actions.

```solidity
    event TokensGenerated(address indexed to, uint amount);
    event TokensDestroyed(address indexed from, uint amount);
```

### Mint Function

The `generate` function mints new tokens, increasing both the total supply and the balance of the specified address. It emits a `TokensGenerated` event to log the action.

```solidity
    function generate(address account, uint amount) public {
        totalTokens += amount;                  // Increase total supply
        tokenBalances[account] += amount;       // Update balance of the account
        emit TokensGenerated(account, amount);  // Emit generation event
    }
```

### Burn Function

The `destroy` function allows for the burning of tokens, reducing both the total supply and the holder's balance, provided they have enough tokens. It emits a `TokensDestroyed` event to log the action.

```solidity
    function destroy(address account, uint amount) public {
        require(tokenBalances[account] >= amount, "Insufficient balance"); // Check balance
        totalTokens -= amount;                   // Decrease total supply
        tokenBalances[account] -= amount;        // Update balance of the account
        emit TokensDestroyed(account, amount);   // Emit destruction event
    }
}
```

## Output

Deploying and interacting with the CustomToken contract will yield the following results:

- **Deployment**: The contract initializes with "Treasure Coin" as the token name and "TSC" as the symbol. The total supply starts at zero.
- **Minting Tokens**: The `generate` function increases the total supply and updates the recipient's balance.
- **Burning Tokens**: The `destroy` function decreases the total supply and the balance of the address, provided they have sufficient tokens.
- **Event Logs**: `TokensGenerated` and `TokensDestroyed` events are logged for minting and burning actions, respectively.

### Example Outputs

- **Minting**:

```plaintext
TokensGenerated(recipient_address, 100);
```

- **Burning**:

```plaintext
TokensDestroyed(holder_address, 50);
```

## Thanks Note

Thank you for exploring the CustomToken smart contract. This project provides a practical introduction to token creation and management on the Ethereum blockchain. By engaging with this contract, you can gain valuable insights into the core functionalities of token operations and develop a solid foundation for more complex decentralized applications. Happy coding, and feel free to reach out if you have any questions or need further assistance.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
