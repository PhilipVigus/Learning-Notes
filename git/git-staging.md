[Main TOC](../README.md) / [git TOC](./git-TOC.md)
# Staging with git
git's staging area is somewhere you can put a file or files before you commit them. It's useful for situations like when you're working on several features and only want to commit changes related to one of those.

There are a number of commands that allow you to work with the staging area:
```
# stage a file you've added to the repo
git add fileName
# stage a file you've removed from the repo
git rm fileName
# stage a file you've moved in the repo
git mv filename newLocation
# remove a staged file
git reset HEAD fileName
```