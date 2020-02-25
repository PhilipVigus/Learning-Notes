[Main TOC](../README.md) / [git TOC](./git-TOC.md)
# Committing with git
Committing moves file changes you've staged into the repository itself. Commands relating to commits include:
```
# commits the staged files, optionally with the specified commit message
git commit (-m “message”)
# Appends whatever you currently have staged to the last commit
# This is useful for things like forgetting to add a file 
git commit --amend 
# Commit all changes, including those that haven't been staged yet
git commit -a
# Commit all changes in the current directory 
git commit .
```
