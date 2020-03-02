[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Loops and iterators
```ruby
# Standard loops
while condition
end

until condition
end

# Prefer this to using while true
loop do
  next if i > 5
  break if i < 0 
end 

# implicitly returns i
def func
  i = 0
  loop do
    break i if i == 10
    i += 1
  end
end

# prints 10
puts func

# Use iterators instead wherever possible
for num in 1...10
end

# There are many, many different iterators
# They have the same basic structure: 
#
# collection.iterator do |block_variables|
#   block
# end
#
# Here are some examples...

list_of_names.each do |name|
  puts name
end 

hash.each do |key, value| # or each_val/each_key
  puts key
  puts value
end

# Prefer brackets when everything is on one line
arr.map { |ele| ele.to_s }

# etc etc
```