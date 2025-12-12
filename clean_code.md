# Clean Code Reflection

## Why is code formatting important?
Consistent formatting makes code easier to read and maintain. It ensures all developers follow the same structure, reducing confusion and errors during collaboration.

## What issues did the linter detect?
Initially, ESLint flagged two issues: the function `sayHello` was defined but never used, and `console` was not defined. It also showed style warnings related to semicolons and quote consistency.

## How did you resolve it?
I called the function to remove the unused variable warning, added `/* eslint-env browser */` so ESLint recognizes browser globals, and changed to single quotes with proper semicolons based on the Airbnb style guide.

## What did you learn?
I learned how ESLint and Prettier enforce professional code standards automatically. They catch both syntax and style issues early, making the code more readable, consistent, and error-free.


---

## Refactoring Code for Simplicity

### What made the original code complex?
The original function had too many conditional checks and repetitive logic. It handled null values and negative results manually, which made it longer and harder to understand.

### How did refactoring improve it?
I replaced multiple conditions with a default parameter (`discount = 0`) and used `Math.max()` to ensure non-negative prices. This reduced the code to a few clear lines while maintaining the same functionality.

### Reflection
Refactoring improved readability and reduced unnecessary logic. The new version is shorter, easier to test, and aligns with clean coding practices that emphasize simplicity and clarity.
