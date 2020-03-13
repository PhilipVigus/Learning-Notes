[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# OOP in Ruby

```ruby
# must be capitalised
class ClassName
	@@class variable = v		# @@ for class (static) vars
	
	# auto-creates getters and/or setters
	# attr_accessor :name is equiv to:-
	
	# def name
	#	@name
	# end
	
	# def name=(val)
	#	@name = val
	# end	
	attr_writer/reader/accessor :name
	
	# constructor
	def initialize (v)
		# @ for instance vars
		@instance variable = v	
		# $ for globals declared in classes
		$global variable = v	
	end
	
	# all below are public methods
	public
		
	# class (static) method
	def ClassName.method
	end
	# all below are private methods
	private
end

# to create an instance of a class (instantiation)
# new returns the memory address of the instance in hexadecimal
class_instance = ClassName.new

# inheritance
# to view a class’s ancestors you can use Class.ancestors[n]
# where 1 is the parent, 2 is the grandparent etc
class ChildClass < ParentClass
	# to override
	def methodWithSameParentName
		# calls parent method from where called
		super				
	end
end
```
