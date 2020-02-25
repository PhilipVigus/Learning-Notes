# Setting git up after you've first installed it

You need to run several commands if you've just installed it on your system:
```
git config --global user.name "your name"
git config --global user.email "your email"

# The next two set the way git handles line endings, and helps handle situations where you have devs working on a mix of different operating systems

# leave CRLF endings on Windows checkouts, but use LF endings on MacOS and Linux systems and in the repository itself
git config --global core.autocrlf input

# git will warn you if converting line endings for a particular commit is reversible or not
git config --global core.safecrlf true
```
When you start a new project run `git init`, which will initialise a repository in the current directory. This creates a .git folder where git tracks changes and does its magic.