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


## Understanding Clean Code Principles

### Simplicity  
Keep code as simple as possible. Simplicity means doing just what’s necessary — no extra complexity, clever tricks, or unnecessary abstractions. Simple code is easier to read, test, and maintain. Developers should aim for clarity instead of trying to impress with overly complex solutions.

### Readability  
Readable code is self-explanatory. Anyone (including your future self) should be able to understand what it does without needing comments everywhere. Using clear variable names, consistent indentation, and logical structure improves comprehension. The goal is to make the code communicate intent clearly.

### Maintainability  
Good code is written for the long term. Maintainable code allows developers to make changes or add new features easily without breaking existing functionality. Writing modular, well-structured functions and avoiding repetition (DRY principle) helps future developers work efficiently.

### Consistency  
Consistency means following the same coding style, conventions, and patterns throughout a project. Using the same formatting, naming rules, and commenting style makes collaboration easier and avoids confusion. A consistent codebase looks professional and feels predictable.

### Efficiency  
Efficient code performs well without being over-optimized. The goal is to write clean, performant logic that uses resources wisely but still prioritizes readability. Avoid premature optimization — make the code clear first, then improve performance where necessary.

---

## Naming Variables & Functions

### What makes a good variable or function name?
A good name is clear, specific, and describes the purpose of the value or behaviour. It should answer “what is this?” or “what does this do?” without needing extra comments. Good names are usually:
- Descriptive but not overly long (e.g. `totalPrice`, `calculateAverage`)
- Written in a consistent style (camelCase for variables/functions)
- Based on the domain language of the problem (e.g. `userId`, `sessionDuration`)

### What issues can arise from poorly named variables?
Poorly named variables like `a`, `b`, `x1`, or `data` make the code harder to read and easier to misunderstand. They slow down debugging and onboarding, because future developers must constantly trace where values come from. Bad names also increase the risk of bugs when someone misinterprets what a variable represents or reuses it for the wrong purpose.

### How did refactoring improve code readability?
Refactoring the `calc(a, b)` example into `calculateRemainingSeconds(totalMinutes, usedMinutes)` immediately made the intent of the function clear. The new names explain that the function works with minutes and converts them to seconds, then returns the remaining time. As a result, the code is easier to scan, requires fewer comments, and is safer to maintain because each variable’s meaning is obvious.

---

## Writing Unit Tests for Clean Code

### How do unit tests help keep code clean?
Unit tests encourage me to write small, focused functions with clear inputs and outputs. To make a function testable, I have to avoid hidden side effects and keep the logic simple, which aligns with clean code principles. Tests also act as living documentation: by reading the test names and expectations, another developer can quickly understand how a function is supposed to behave.

### What issues did you find while testing?
When I started writing tests for `calculateRemainingSeconds`, I realised that the original version did not handle negative values or situations where `usedMinutes` was greater than `totalMinutes`. The tests for those edge cases either produced negative results or unexpected behaviour. Refactoring the function to throw an error for negative inputs and clamp the remaining time to zero made the behaviour clearer and more reliable. The tests now verify these cases, so if I accidentally break the logic in the future, the failing tests will alert me immediately.
