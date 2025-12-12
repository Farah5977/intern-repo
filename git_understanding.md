### Git Merge Conflict Reflection

### What caused the conflict?
The conflict occurred because the same line in `competitive_landscape_updated.md` was edited differently on the `main` and `conflict-branch` branches. Git couldn’t automatically decide which version to keep.

### How did you resolve it?
I used GitHub’s conflict editor to review both versions, removed the conflict markers, kept my final combined line, and marked the conflict as resolved. After committing the merge, the pull request showed no further conflicts.

### What did you learn?
I learned how merge conflicts happen when two branches modify the same part of a file. I also learned how to manually resolve them using GitHub’s interface, mark the conflict as resolved, and complete a clean merge between branches.
