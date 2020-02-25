[Main TOC](../README.md) / [git TOC](./git-TOC.md)
# Checking git's status
`git status` gives a summary of what has  changed since the last commit.
`git log` has a multitude of options that display a list of commits in varying formats. These mainly fall under the `--pretty=format` and `--pretty=oneline` flags. For example:
```
# a simple list of the last commits
git log
# summarises each commit on a single line
git log –pretty=oneline
# gives a graphical representation of branches (and tags)
git log --oneline --decorate --graph (–all)

# and a more complex example
# 	%h = the commit hash
# 	%ad = the author date
# 	%s = the commit
# 	%an = the author name
# 	--graph = shows a graphical representation of any branching
# 	-date=short = a short date format
git log --pretty=format:'%h %ad | %s%d [%an]' --graph –date=short

```