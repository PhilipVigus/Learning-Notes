[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Blocks

- Blocks are sections of code between start...end (multi-line blocks) or {...} (single line)
- They are associated with a particular method call, and must appear immediately adjacent to that call and start on the same line immediately after the method arguments
- Blocks can have their own arguments, and return the last evaluated expression
- Any method can be called with a block as an implicit argument. Whether the method does anything with it is another matter
- Methods invoke blocks using the yield keyword
```ruby
def block_method_example(arg)
  puts arg
  
  # without this check it would throw an error if no block is passed in
  if block_given?
    yield("Phil")
    yield(arg)
  end
end

# the block is defined immediately after the method call's argument list
block_method_example("Wibble") { |name| puts "My name is #{name}" }

# output...
Wibble
My name is Phil
My name is Wibble
```