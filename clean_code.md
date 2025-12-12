# Clean Code Reflection

## Why is code formatting important?
Consistent formatting makes code easier to read and maintain. It ensures all developers follow the same structure, reducing confusion and errors during collaboration.

## What issues did the linter detect?
Initially, ESLint flagged two issues: the function `sayHello` was defined but never used, and `console` was not defined. It also showed style warnings related to semicolons and quote consistency.

## How did you resolve it?
I called the function to remove the unused variable warning, added `/* eslint-env browser */` so ESLint recognizes browser globals, and changed to single quotes with proper semicolons based on the Airbnb style guide.

## What did you learn?
I learned how ESLint and Prettier enforce professional code standards automatically. They catch both syntax and style issues early, making the code more readable, consistent, and error-free.
