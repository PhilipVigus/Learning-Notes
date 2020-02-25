[Main TOC](../README.md) / [git TOC](./git-TOC.md)
# Tags in git

Tags are used to mark fixed points in the repository, release versions. There are light and annotated tags, the latter including information about who created them and creation date. Annotated tags are also stored as objects within the git database. 
```
# create a lightweight tag (at the specified commit)
git tag tagName (hash)
# create an annotated tag with a message (at the specified commit)
git tag -a tagName -m “tag message” (hash)
# list existing tags
git tag -l
# delete a tag
git tag -d tagName
```