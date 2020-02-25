[Main TOC](../README.md) / [git TOC](./git-TOC.md)
# Undoing commits in git
There are two main ways of undoing a commit, reverting and resetting
```
git revert HEAD
```
This reverts the previous commit. What this means in practice is that it creates a new commit that reverses the last one, so it is non-destructive and keeps the full commit history. This generally makes it the safest way of undoing the last commit.
```
git reset (--hard/soft/mixed) tagName/commitHash
```
This resets the specified commit. The exact effects depend on the mode specified:

- --hard is the most direct and dangerous option. Anything staged or in the working directory is lost, and repo pointers (HEAD and the active branch) are moved to the specified commit
- --mixed is the default mode, and is the same as hard except the working directory is not affected. Any staged changes are moved back to the working directory
- --soft is the lightest, and only the repo pointers are affected
Git reset will never delete a commit. However it can and will orphan them by leaving them with no specified parent commits and no direct path for a reference such as HEAD or master to access them. Orphaned commits are usually deleted when git runs its garbage collector, which defaults to once every 30 days. 

Revert is safe. **Reset is potentially very dangerous** as it can permanently delete work. It should never, ever be used when the things being affected have been pushed to a public repo that others are working on, as you have to assume they are reliant on the commits.