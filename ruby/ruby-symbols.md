[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Symbols
Defined using the following syntax:
```ruby
my_symbol = :sym
my_other_symbol = :"sym with spaces"
```
They are unique and immutable (but should **not** be seen as immutable strings as they have no string methods), and have a number of advantages over strings in certain situations:

- they are faster than strings as keys in hashes
- they are more memory efficient as each reference to a particular symbol points to exactly the same object

Their general usecase is whenever you need an identifier that should not change, eg hash keys.

Although symbols can be created dynamically:
```ruby
("cats" + "dogs").to_sym
```
this was a bad idea in older versions of Ruby (pre-2.2.0) as symbols could not be garbage collected until a program stopped running, which means they could end up being a memory-hog

