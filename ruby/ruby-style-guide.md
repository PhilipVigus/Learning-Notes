[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Ruby style guide

#### Naming conventions
```
# Constants
CONSTANT_NAME
# Variables
variable_name
# Classes
ClassName
# Methods
method_name
# File names
file_name

```
#### Line indents
- Use spaces and not tabs
- Each line indent should be two spaces

#### Empty lines
Methods
```
# Separate individual methods with an empty line
def method1
  # Also use them to split methods up into logical sections
end

def method2

end
```
Method, class, module and block content
```
# Don't use them around the content of methods, classes, modules or blocks
class ClassName
  def methodName
    begin
    	# do something
    end
  end
end
```

#### Operators
```
# Most of the time
1 + 2
3 * 4
1 - 2 = 3
# Except
1**2
```

#### Brackets
```
# Round brackets
method_name(args)
# Curly brackets
5.times { |index| puts index }
# Square brackets
my_array = [4, 5, 6, 7, 8]
```

#### Case...when
```
# note you don't indent the whens
case
when
  # do something
when
  # do something else
else
  # panic
end
```

#### Method arguments
```
# How to align method arguments when on multiple lines
object_instance.method(arg1,
					   arg2,
					   arg3,
					   arg4
)
```