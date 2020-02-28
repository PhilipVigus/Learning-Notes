[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Parallel assignment

```ruby
# a = 1, b = 2
a, b = 1, 2 

# a = 2, b = 1
a, b = b, a

# returning multiple values from methods
def multiple_returns
  return 1, 2, 3
end

# a = 1, b = 2, c = 3
a, b, c = multiple_returns()

# with arrays
# first_name = "John", second_name = "Smith"
first_name, last_name = ["John", "Smith"]

# first_name = "John", second_name = ["Smith", "III"]
first_name, *last_name = ["John", "Smith", "III"]

# first_name = "John", second_name = nil
first_name, last_name = ["John"]
```