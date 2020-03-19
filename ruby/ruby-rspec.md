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
