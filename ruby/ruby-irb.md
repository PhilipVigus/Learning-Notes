[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# The Interactive Ruby Shell (irb)

This is a command-line tool that allows you to interactively explore ruby statements and expressions by typing them in directly and seeing the results.

It is an example of an REPL (Read, Evaluate, Print Loop), a simple interactive programming environment that reads what the user types, evaluates it and prints the outcome.

You launch irb in the following ways:
```
# basic launch
irb 
# launch with the specified files preloaded
irb -r files_or_gems_to_load
```
irb can also be configured by editing the .irbrc file, which is located in your home (~) directory. This can do things like enable autocompletion or automatically saving your command history to an external file.