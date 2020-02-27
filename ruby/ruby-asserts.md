[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Asserts

Asserts can be used as breakpoints in code. There are a variety of formats available:
```ruby
# will fire because the condition is not true
assert(1 == 2)

# you can set a message
assert(1 ==2, "These things are not equal"

# test equality
assert_equal(1, 2)

# etc
```
A full list of asserts can be found [here](https://docs.ruby-lang.org/en/2.1.0/Test/Unit/Assertions.html).