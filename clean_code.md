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

---

## Commenting & Documentation

### When should you add comments?

Comments are most useful when they explain **why** the code exists, not just **what** it does. I should add comments when:
- The code implements a non-obvious business rule or requirement.
- There is a workaround for a bug or limitation in another system or library.
- The algorithm is complex and a short summary will help future readers.
- I want to document how to use a function (its parameters, return value, and side effects).

Good comments provide context and intent so another developer can quickly understand the design decisions behind the code.

### When should you avoid comments and instead improve the code?

I should avoid comments when they only repeat what the code already says. In those cases, it is better to improve the code itself by:
- Renaming variables or functions to be clearer.
- Breaking a long function into smaller helper functions with meaningful names.
- Removing dead or commented-out code instead of explaining why it is there.
- 
If a comment is trying to explain confusing code, that is often a signal that the code should be refactored. Clean, well-named functions usually need fewer comments because the intent is already clear.

---

## Handling Errors & Edge Cases

### What was the issue with the original code?
The original `calculateAverage` function assumed that the `numbers` argument was always a valid, non-empty array of numbers. It did not check for `null`, `undefined`, empty arrays, or invalid values. This could easily lead to crashes or `NaN` results if the function was called with unexpected input.

### How did refactoring improve error handling?
In the refactored version, I added a guard clause at the top of the function to ensure that `numbers` is a non-empty array. I also validated each element and threw clear errors if any value was not a valid number. Instead of failing silently or returning `NaN`, the function now fails fast with informative error messages, which makes bugs easier to detect and fix.

### How does handling errors improve reliability?
Handling errors and edge cases improves reliability because the code behaves predictably even when inputs are wrong. Guard clauses prevent invalid data from flowing through the rest of the function, and explicit errors make it clear what went wrong. This reduces hidden bugs, protects against unexpected crashes, and makes the behaviour of the function easier to understand and trust in real applications.

---

## Writing Small, Focused Functions

### Why is breaking down functions beneficial?
Breaking down a large function into smaller, single-purpose functions improves clarity and maintainability. Each function has a clear responsibility, making it easier to understand, test, and reuse. When each piece does only one thing, debugging and updating the code become much simpler because you can identify which specific function needs changes.

### How did refactoring improve the structure of the code?
The original `processOrder` function mixed validation, calculations, and side effects. After refactoring, each operation was placed in its own helper function (`validateOrder`, `calculateTotal`, `applyDiscount`, etc.). This improved readability and allowed for future changes (like adding new discount types or saving methods) without affecting unrelated parts of the code. The structure now follows the Single Responsibility Principle and supports cleaner, modular development.
