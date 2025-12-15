# Identifying & Fixing Code Smells

## What code smells did you find in your code?

In the original `processUser` function I identified several common code smells:

- **Magic Numbers** – Values like `30`, `14`, and `365` were hardcoded with no explanation, which made it unclear what they represented.
- **Long Function / Too Many Responsibilities** – `processUser` was responsible for checking user activity, calculating subscription expiry, and sending emails in a single block of code.
- **Duplicate Code** – The logic for `pro` and `enterprise` subscriptions both added `365` days separately instead of reusing a single rule.
- **Deeply Nested Conditionals** – The `if` / `else` tree for deciding whether a user was active was difficult to read and reason about.
- **Commented-Out Code** – Old debug `console.log` statements were left in the function and no longer used.
- **Inconsistent Naming** – Short variable names like `u`, `t`, `isAct`, and `expD` did not clearly describe their purpose.

These smells made the function harder to understand, test, and safely modify.

## How did refactoring improve the readability and maintainability of the code?

Refactoring the function into smaller, focused helpers (`isActiveUser`, `calculateExpiry`, `sendUserEmail`) improved the structure significantly. I replaced magic numbers with descriptive constants such as `TRIAL_DAYS`, `YEAR_DAYS`, and `RECENT_LOGIN_DAYS`, which makes the business rules explicit. Duplicate code for subscription durations was removed by combining the `pro` and `enterprise` branches.

The early-return style in `isActiveUser` flattened the deeply nested conditionals and made the decision logic easier to follow. Clear parameter and variable names (`user`, `subscriptionType`, `expiry`) communicate intent without requiring extra comments. As a result, the code is more readable, easier to test in isolation, and safer to change because each function has a single responsibility.

## How can avoiding code smells make future debugging easier?

Avoiding code smells makes debugging easier because the behaviour of the code is more predictable and localized. When each function has a clear purpose and uses well-named constants and variables, it is simpler to trace where a bug is coming from. Removing duplication reduces the chance of fixing a bug in one place but forgetting another copy of the same logic. Clean, well-structured code also encourages adding unit tests, which helps catch regressions early. Overall, eliminating code smells leads to a codebase that is easier to reason about, quicker to diagnose, and less likely to break when new features are added.
