[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Scope

#### Constants

```ruby
CONST = "global"

class MyClass
  CONST = "nested"
  
  def access_constants
    # prints "global"
    puts ::CONST
    
    # prints "nested", accessing via its relative path
    puts CONST
    
    # prints "nested", accessing via its absolute path
    puts MyClass::CONST
    puts ::MyClass::CONST
  end
  
  class MyNestedClass
    def access_enclosing_class_constant
      # inherits the const from the enclosing class
      # prints "nested"
      puts CONST
    end
  end
  
  # when the same const name exists in lexical and inherited scope,
  # precedence depends on how the child class's scope is defined
  class MySubClass
    CONST = "parent"
  end
  
  # implicit scoping
  # inherited scope wins
  class MyChildClass < MyClass
    def access_const
      # prints "parent"
      puts CONST
    end
  end
  
  # explicit scoping
  # lexical scope wins
  class MyClass::MyChildClass < MyClass
    def access_const
      # prints "nested"
      puts CONST
    end
  end
end
```