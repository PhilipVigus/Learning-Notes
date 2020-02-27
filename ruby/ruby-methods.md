[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Methods

Methods are reusable procedures (lists of instructions). They help with making sure your code is DRY (do not repeat yourself), and you can pass arguments into them to 'configure' how they work.

Method names should end with a ? if they return true/false or a ! if they are dangerous and alter what you are calling the method on. Many methods have both dangerous and safe versions:
```ruby
str = "This is a test"
puts str.gsub(/e/, 'a')
console => "Thas is a tast"
str => "This is a test"

puts str.gsub!(/e/, 'a')
console => "Thas is a tast"
str => "Thas is a tast"
```

#### Arguments

There are various different types of method arguments:
```ruby
# standard
# will raise an error if you call with the wrong number of arguments
def print_to_screen(str1, str2)
  puts str1 + str2
end

# optional
# allows the method below to be called with one or two arguments
def print_to_screen(str1, str2 = "")
  puts str1 + str2
end

# keyword
# named arguments to increase clarity and prevent mixing up argument order
def print_to_screen(str1:, str2:)
  puts str1 + str2
end
# called with arguments in any order and clearly defines the argument meanings
print_to_screen(str2: "this is string 2", str1: "this is string 1")

# variable numbers of arguments
# strings is passed as an array of arguments
print_to_screen(*strings)
  puts strings.join
end
# strings is passed as a hash for keyword arguments
print_to_screen(**strings)
  #do something with the hash
end
```

#### Returning from methods
Method returns are implicit in Ruby. This means that a method will return the last evaluated expression without you having to explicitly use the return keyword:
```ruby
# instead of this
def convert_words_to_caps(words)
  return arr.map { |word| word.upcase }
end

# we can use this
def convert_words_to_caps(words)
  arr.map { |word| word.upcase }
end
```