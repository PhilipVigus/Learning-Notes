[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)
# Truthy and falsy in Ruby
- Truthy values are those that evaluate to true when used as conditionals, falsy values are those that evaluate as false.
- **The only falsy values in Ruby are nil and false itself. Everything else evaluates to true. **(Compare with Javascript, where things are very, very different).
```ruby
if 0 # or "" etc etc...
  puts true
else
  puts false
end

=> true

if nil # or false
  puts true
else
  puts false
end

=> false

```