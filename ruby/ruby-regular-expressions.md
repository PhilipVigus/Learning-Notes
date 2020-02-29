[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Regular expressions

Ways of doing matches in Ruby
```ruby
# standard match against a string
# will only match the first instance
"some matching content"[/match/] == "match"
"some matching content"[/missing/] = nil

# matches and returns all instances as an array
"one two-three".scan(/\w+/) == ["one", "two", "three"]

# matches the first pattern of t followed by 0+ letters
# replaces it with the first letter of that match, which is a t
"one t-three", "one two-three".sub(/(t\w*)/) { $1[0, 1] } == "one t-three"

# the same as the above but does it for all matches
"one two-three".gsub(/(t\w*)/) { $1[0, 1] } == "one t-t"

```

Capture groups
```ruby
"Gray", "Gray, James"[/(\w+), (\w+)/, 1] == "Gray"
"Gray, James"[/(\w+), (\w+)/, 2] == "James"

# using variables in capture groups
"Name:  Gray, James"[/(\w+), (\w+)/] == "Gray, James"
$1 == "Gray"
$2 == "James"
```

Cheat sheet
```
# add ? to the end of any of these to make them non-greedy
+ = one or more
* = zero or more
{n} = exactly n occurances
{n, m} = between n and m
{n,} = at least n
{,m} = up to m

. = any non-newline character
() = capture group
(?:) = non-capture group
| = or
[] = character set
^ = negation if within a character set, eg [^0-9]

# note capitalised versions are these but negated
\d = any digit
\s = any whitespace character
\w = [a-zA-Z0-9_]

\A = anchor to start of string
\z = anchor to end of string
^ = anchor to start of line
$ = anchor to end of line
\b = anchor to word boundary
\B = anchor to non-word boundary

x(?=y) = positive look-ahead
x(?!y) = negative look-ahead
(?<=y)x = positive look-behind
(?<!y)x = negative look-behind
```