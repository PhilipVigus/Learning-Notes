[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

#Arrays

#### Slicing
Arrays can be sliced with the following syntax:
```ruby
# arr[n, m]
# n = start index
# m = slice length
arr = [0, 1, 2, 3]
arr[1, 3] = [1, 2, 3]

# Beware the following gotcha
# Despite both these calls being outside of arr's bounds,
# the results are different.
# This is because the behaviour for this syntax is varies
# depending on whether you access the index at the end of
# the array (which returns []) or beyond that (which returns
# nil)
# https://ruby-doc.org/core-2.4.1/Array.html#method-i-5B-5D

arr[4, 0] = []
arr[5, 0] = nil

# ranges
arr = [0, 1, 2, 3]
arr[2..-1] = [2, 3]																									
```