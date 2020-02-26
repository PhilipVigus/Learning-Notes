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

# etc etc
```