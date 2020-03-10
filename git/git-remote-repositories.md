[Main TOC](../README.md) / [git TOC](./git-TOC.md)

# Remote repositories

These are stored on a server, eg Github.

```
# Add a link from your local repo to a remote
# For the first or only remote, the convention for the name is origin
git remote add remote_name remote_address

# Shortcut to copy an entire remote repo. The same as:
# mkdir repo_name
# cd repo_name
# git init
# git remote add origin master
# git pull
# cd ..
git clone remote_name

# Show a remote's status
git remote show remote_name

# Rename a remote
git remote rename old_name new_name

# Delete a remote
git remote rm remote_name


# Push your code from local version of the branch 
# to the remote version of the branch, creating it
# if it doesn't already exist
# -u saves the source and target as defaults for
# the push and pull commands
git push remote_name local_branch_name 

# to push to a remote branch with a different name
git push remote_name local_branch_name:remote_branch_name

# Get the most recent version of the code from the remote
# Pull automatically merges to the specified branch
git pull remote_name local_branch

# fetch doesn't merge. In order to merge the new code into
# your current branch:
# sync to remote but don't merge
git fetch remote_name

# merge into your local repo
git merge remote/branch_name

# check out the branch starting at the remote/branch_name reference
# this also sets up a tracking branch, so when you pull on that
# branch git knows to pull from the remote version of the same branch
git checkout -b branch_name remote/branch_name

# a shortcut for the previous command
# assumes local and remote branches have the same name
git checkout --track remote/branch_name

# view active tracking branches
git branch -vv
```

#### Remote tracking branches

- These are local references to branches on remotes. You can't move them manually, but they update any time there is network communication between the local and the remote.
- They take the form remote_name/branch_name
- Calling something like `git fetch remote_name` will synch with the remote, updating any remote tracking branches on your local repo
- You can have multiple tracking branches to multiple remotes