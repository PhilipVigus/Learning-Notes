[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Rspec

Rspec is one of the main tools for TDD in Ruby.

## Installation

```ruby
gem install rspec
```

## Initialisation

In the project's root folder:

```ruby
rspec --init
```
creates a barebones structure including a .rspec configuration file and spec folder, which holds the project's tests.

.rspec appends the options in it to the rspec command whenever you type it so you don't have to remember each time.

## Spec files

```ruby
require 'filename_being_tested'

describe ClassBeingTested do
  context 'Context within class' do
    it 'Individual test description' do
      # individual tests
      # subject = shorthand for the class specified in the describe statement
      expect(subject.method).to eq expected_result
      
      # check whether a class has a specific method
      expect(subject).to respond_to :method
      
      # check that methods raise errors
      # see here for an explanation of the difference between () and {} notation
      # https://stackoverflow.com/questions/21567838/when-to-use-curly-braces-vs-parenthesis-in-expect-rspec-method
      expect { subject.method }.to raise_error 'expected error message'
    end

	 # one-line notation for more concise test descriptions
	 # the subject is not specifically set, but is taken from the describe statement
  	 it { is_expected.to respond_to(:dock).with(1).argument }
  end
end
```

## Predicate matchers

This works for any predicate method (returns true/false and ends in a question mark). be_method_name without the question mark exercises the method and uses its return value.

```ruby
class SomeClass
	def happy?
		true
	end
end

it 'is happy' do
	expect(subject).to be_happy
end
```

## Method chaining

Method chaining is an elegent way of specifying a nested stub call without having to create doubles within doubles within doubles etc...

It's particularly useful when you are passing in a class into a method as part of dependency injection, and need to stub the call to the classes new method and also a method on what is returned by the new call.

```ruby
class SomeClass
	def use_another_class(class_to_use)
		instance = class_to_use.new
		instance.some_method 
	end
end

it 'prevents convoluted doubles and stubs' do
	another_class_double = double(:another_class)
	allow(another_class_double).to receive_message_chain(:new, :some_method)
end
```

