[Main TOC](../README.md) / [git TOC](./git-TOC.md)

# Aliases

Allow you to use shortcuts for commonly used commands:
```
# You can type co instead of checkout
git config –global alias.co checkout 
```

Examples:

- co = checkout
- ci = commit
- st = status
- br = branch
- hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
- type = cat-file -t
- dump = cat-file -p