[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Arrays

#### Creating
```ruby
arr = Array.new()
arr == []

arr = Array.new(4)
arr == [nil, nil, nil, nil]

arr = Array.new(4, 2)
arr == [2, 2, 2, 2]

arr = Array.new(4, [])
arr == [[], [], [], []]
# BUT all elements point to the same object unless the objects are immutable
arr[0].object_id == arr[1].object_d # etc
arr[0].push(1)
arr == [[1], [1], [1], [1]]

# here, the block gets executed each time an element is added
# this makes sure each element is new and different to the others
arr = Array.new(5){ [] }
arr[0].push(1)
arr == [[1], [], [], []]
```

#### Adding elements

```ruby
arr = [1, 2, 3]
arr[6] = 4
arr == [1, 2, 3, nil, nil, nil, 4]
```

#### Slicing

Arrays can be sliced with the following syntax:
```ruby
# arr[n, m]
# n = start index
# m = slice length
arr = [0, 1, 2, 3]
arr[1, 3] == [1, 2, 3]

# Beware the following gotcha
# Despite both these calls being outside of arr's bounds,
# the results are different.
# This is because the behaviour for this syntax is varies
# depending on whether you access the index at the end of
# the array (which returns []) or beyond that (which returns
# nil)
# https://ruby-doc.org/core-2.4.1/Array.html#method-i-5B-5D
arr[4, 0] = []
arr[5, 0] == nil

# ranges
arr = [0, 1, 2, 3]
arr[2..-1] == [2,3]																									
```
#### Sorting

```ruby
arr = [3, 2, 1, 4]
arr.sort() == [1, 2, 3, 4]	# true

# the block after sort_by must return a numerical value
# the a <=> b operator returns -1 if a > b, 0 if equal and 1 if b > a
arr = ["one", "three", "five"]

# the next two do the same thing
arr.sort_by(&:length) == ["one", "five", "three"]
arr.sort { |a, b| a.length <=> b.length } == ["one", "five", "three"]
```