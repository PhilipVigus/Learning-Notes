[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Control flows

```ruby
# unless effectively means !if

# Truncated conditional on a single line
puts "true" if i < 0
puts "false" unless j > 1

# Ternary operator
puts i == 0 ? "i is 0" : "i is not 0

# Standard conditional
if a == 3
  # do something
elsif b == 5
  # do something else
else
  # do the last thing
end

# Ruby doesn't use the switch keyword...
# note the indentation
case a
when 1
  puts "a = 1"
when 2..5
  puts "a is between 2 and 5"
else
  puts "who knows!"
end
```