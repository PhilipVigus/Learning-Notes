[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Symbols
Defined using the following syntax:
```ruby
my_symbol = :sym
```
They are unique and immutable, and have a number of advantages over strings in certain situations:

- they are faster than strings as keys in hashes
- they are more memory efficient as each reference to a particular symbol points to exactly the same object

Their general usecase is whenever you need an identifier that should not change, eg hash keys.

