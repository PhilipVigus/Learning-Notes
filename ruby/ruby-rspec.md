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

## Spec file structure

```ruby
require 'filename_being_tested'

describe ClassBeingTested do
  context 'Context within class' do
    it 'Individual test description' do
      # individual tests
    end
  end
end
```
