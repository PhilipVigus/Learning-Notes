[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Strings

#### Creating:
```ruby
# all the same (broadly) - see later for why single quotes differ compared to double quotes
str = String.new("this is a string")
str = "this is a string"
str = 'this is a string'

# Flexible strings
%{This is a multi-line string
where you don't have to escape characters""!!''. The
percent sign can be any non-alpha-numeric character as
long as it matches what you use at the start.	
}%

# here-documents
<<-DELIM
Another way of specifying a multi-line string that
keeps the
formatting. delim can be any word or identifier as long as
the beginning and end match. It doesn't have to be caps, but
doing that makes it stand out better.
DELIM
```


Single quoted strings:
- do not interpret escape characters apart from \' and will print them literally
- do not allow string interpolation

#### Concatenation:
```ruby
str1 = "Hello"
str2 = "You"

# the shovel operator is faster than +=, which makes
# a copy of the first string, so it's seen as the
# better option where possible
puts str1 += str2	# prints "HelloYou"
puts str1 << str2	# prints "HelloYou"

```

#### Interpolation
```ruby
# automatically converts the variable into a string
var = 12
puts "The variable = #{var}" # prints "The variable = 12"
```

#### Accessing substrings
```ruby
# The same syntax as subarrays
str = "This is a string"
puts str[3, 4] # prints "s is"
```