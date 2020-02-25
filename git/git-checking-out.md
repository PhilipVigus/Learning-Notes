[Main TOC](../README.md) / [git TOC](./git-TOC.md)
# Checking out files with git
The git checkout command moves you between locations within the repository. By checking out a branch, tag or commit, you update all files within your working directory to match that version. There are several different uses of the checkout command within that context:
```
# unmodify a file
git checkout fileName
# check out the specified branch, commit or tag
git checkout branchName/commitHash/tag
# create a new branch, then check it out
git checkout -b branchName
```