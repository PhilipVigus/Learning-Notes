[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Lambdas and procs

#### Lambdas

A lambda is a reusable block, and there are two ways of creating them:
```ruby
# these are equivalent ways of defining lambdas
lambda1 = lambda { |i| i + 1 }
lambda2 = -> { |j| j % 2 == 0 }
lambda3 = ->(k) { |k| k**k } 
```

They can be called in various ways:
```ruby
my_lambda.call(arg) # probably the clearest in intent
my_lambda.(arg)
my_lambda[arg]
```
If you pass the wrong number of arguments into a lambda it will throw an error.

#### Procs

Procs are very similar to lambdas in what they are used for. However, there are differences...

Creation:
```ruby
proc = Proc.new { |y| puts "argument value = #{y}" }
```

Procs don't care about the number of arguments you pass into them, and won't throw an error if they differ from the number expected by the proc:
```ruby
proc = Proc.new { |x, y| "This won't throw an error if you pass one, three etc arguments" }

# won't throw errors
proc.call(2)
proc.call()
```

The way they 'return' is significantly different:
```ruby
# procs
# returning from a proc is the same as returning from the method the proc was called from
# this means you can't return from a proc outside of a method as it will throw an error
def proc_return
  puts "before call to proc"
  proc = Proc.new { return 2 }
  proc.call
  puts "after call to proc" # never called, as returning from the proc returns from the method too
end

proc_return()

# output
before call to proc

# lambdas
# returning from lambdas returns to the context the lambda was called from
def lambda_return
  puts "before call to lambda"
  lambda = -> { return 2 }
  lambda.call
  puts "after call to lambda"
end

lambda_return()

# output
before call to lambda
after call to lambda
```

