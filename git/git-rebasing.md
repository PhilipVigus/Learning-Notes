[Main TOC](../README.md) / [git TOC](./git-TOC.md)
# Rebasing with git
Rebasing is an alternate to merging, the difference being that it leaves you with a linear commit timeline and removes branching commits. As it is destructive and alters the structure of existing commits, it should not be done with work that exists outside of your repository as rebasing will alter commits, forcing others to merge them again. This gets messy very quickly.

Rebasing 'pastes' the commits from the branch you are losing into the remaining branch, incorporating the differences:
```
# rebase the named branch back into the active branch
# the i flag makes the process interactive, allowing you
# to ignore and/or reorder commits
git rebase (-i) branchName
```