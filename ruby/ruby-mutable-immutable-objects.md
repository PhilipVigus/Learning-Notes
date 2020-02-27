[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Mutable and immutable objects

- Mutable objects can be altered after creation, immutable objects cannot
- In Ruby, the only immutable objects are numbers and symbols. They are constant. Everything else is mutable and can be mutated
- Mutable objects can be made immutable by calling the freeze method on them. However, this 'freezing' is only shallow. This means that any objects within the frozen object are still mutable:
```ruby
arr = [1, 2, ['a', 'b']]
arr.freeze

# throws an error 
arr.push(1)

# works fine because the inner array is not frozen
arr[2].push(1)
```