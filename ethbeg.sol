// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/*
    MODIFIED CONTRACT

    1. This contract includes public variables for storing details about the token (Token Name, Symbol, and Total Supply).
    2. A mapping tracks the balance of each address holding the token.
    3. A `generate` function allows increasing the total supply and the balance of a specific address.
    4. A `destroy` function decreases the total supply and the balance of a specific address, ensuring the balance is sufficient.
    5. The `destroy` function includes checks to confirm that the balance is adequate before burning tokens.
*/

contract CustomToken {

    // Public variables for token details
    string public name = "Treasure Coin";      // Token Name
    string public symbol = "TSC";              // Token Abbreviation
    uint public totalTokens = 0;               // Total Supply

    // Mapping to store balances for each address
    mapping(address => uint) public tokenBalances;

    // Events for generating and destroying tokens
    event Tokensmint(address indexed to, uint amount);
    event Tokensburn(address indexed from, uint amount);

    // Function to generate new tokens
    function mint(address account, uint amount) public {
        totalTokens += amount;                  // Increase total supply
        tokenBalances[account] += amount;       // Update balance of the account
        emit Tokensmint(account, amount);  // Emit generation event
    }

    // Function to destroy tokens
    function burn(address account, uint amount) public {
        require(tokenBalances[account] >= amount, "Insufficient balance"); // Check balance
        totalTokens -= amount;                   // Decrease total supply
        tokenBalances[account] -= amount;        // Update balance of the account
        emit Tokensburn(account, amount);   // Emit destruction event
    }
}
