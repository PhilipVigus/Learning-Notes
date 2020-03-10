[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Hashes

Hashes are associative arrays or dictionaries where, rather than access elements with indices as you do with arrays, you access them with keys that are specified when you put the item in the hash.

#### Creation

```ruby
# hash rocket style
hash = {
	“key” => val,
	“key2” => val2
}

# new style that automatically creates keys as symbols
hash_with_symbols = {
	symb1_as_key: val1,
	symb2_as_key: val2
}

hash = Hash.new
hash = Hash.new(default_val) #accessing a non-existent key will give the default value

# makes sure the default empty array is a unique array for each key value
hash = Hash.new {|hash, key| hash[key] = [] }
```

#### Refactoring conditionals using hashes

```ruby
curse = "dang"

if curse == "damn"
  return "That's a curse word! How dare you"
elsif curse == "dang"
  return "That's a less bad curse word! Still, how dare you"
elsif curse == "darn"
  return "Hmm, I'm mildly offended but I'll survive. Watch your language!"
elsif curse == "durn"
  return "Ahh, that's good Southern swearing, that is!"
end
```
becomes:
```ruby
curse = "dang"

# First, set up the options
beratings = {
  "damn" => "That's a curse word! How dare you",
  "dang" => "That's a less bad curse word! Still, how dare you",
  "darn" => "Hmm, I'm mildly offended but I'll survive. Watch your language!",
  "durn" => "Ahh, that's good Southern swearing, that is!"
}

# Second, do a lookup on the beratings hash
beratings[curse]
```

#### Subtleties in accessing non-existent key values

```ruby
hash[“key”] = nil # when key doesn’t exist
hash.fetch(“key”) # throws a KeyError 
```
