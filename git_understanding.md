### Git Merge Conflict Reflection

### What caused the conflict?
The conflict occurred because the same line in `competitive_landscape_updated.md` was edited differently on the `main` and `conflict-branch` branches. Git couldn’t automatically decide which version to keep.

### How did you resolve it?
I used GitHub’s conflict editor to review both versions, removed the conflict markers, kept my final combined line, and marked the conflict as resolved. After committing the merge, the pull request showed no further conflicts.

### What did you learn?
I learned how merge conflicts happen when two branches modify the same part of a file. I also learned how to manually resolve them using GitHub’s interface, mark the conflict as resolved, and complete a clean merge between branches.

## Using git bisect to find a bug

I created a controlled test scenario by introducing a deliberate bug in `bisect_example.js`, where the `add(a, b)` function was changed from addition to subtraction.

I started the bisect process using:

git bisect start  
git bisect bad  
git bisect good 53c08fa  

Git then automatically checked intermediate commits and identified the following commit as the first bad commit:

795cff58faa166771baf56d469d91e25d530b0ee — "Introduce bug in add function (for git bisect test)"

This demonstrated how `git bisect` efficiently narrows down the exact commit that introduced a regression without manually reviewing every commit.

## Branching and Team Collaboration

Pushing directly to the main branch is problematic because it can introduce bugs or unfinished work into the stable codebase, potentially breaking the project for everyone. It also removes the opportunity for code review and testing before changes are shared.

Branches help with reviewing code by allowing developers to isolate their changes and submit them through pull requests. This enables team members to review, discuss, and test the changes before they are merged into main, improving code quality and reducing risk.

If two people edit the same file on different branches, Git keeps the changes separate. When the branches are merged, Git may automatically combine the changes, or if the same lines were modified, it will create a merge conflict that must be resolved manually. This prevents accidental overwrites and ensures changes are reviewed.

