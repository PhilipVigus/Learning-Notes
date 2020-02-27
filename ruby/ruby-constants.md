[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Constants

To define a constant in ruby, all you have to do is start its variable name with a capital letter. However, the convention for constant naming is CONSTANT_NAME
When you attempt to alter a constant it will throw a warning, but will still make the change:
```ruby
A_CONSTANT = 3

# throws a warning
A_CONSTANT = 4

puts A_CONSTANT

# output
4
```