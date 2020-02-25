[Main TOC](../README.md) / [git TOC](./git-TOC.md)
# Branching with git
Branches are just pointers that keep track of the state of the repository after a particular commit, and are easy and cheap to create and destroy.

The default first branch created when you initialise a repository is called master. The HEAD reference is local, and always points to the current branch, and can be detached from a specific branch by making it point to a specific revision.

It is usually a good idea to have a clean working slate when you switch branches, and git will not allow you to switch if you have uncommited changes that differ to those in the branch you are trying to checkout.

Merging is usually done automatically by git, which checks the most recent commit of both branches and does an automatic diff. It then creates a new commit, with the changes from both incorporated. Where conflicts exist that prevent this from being done automatically, a manual tool such as git mergetool is required.

Some commands involving local branches include:
```
# create a branch but don't check it out
git branch branch_name
# check out a branch
git checkout branch_name
# create AND check out a branch
git checkout -b branch_name
# merge the named branch back into the active branch
git merge branch_name
# list any existing branches (with details)
# merged branches are usually safe to delete
git branch (-v) (--merged/no-merged)
# list branches including remote and tracking branches
git branch -vv
# forces master to point to the great-great-grandparent
# of whatever the HEAD pointer is pointing at
git branch -f master HEAD~3 
# delete a branch, leaveing HEAD pointing at the most recent commit
git -d branch
```