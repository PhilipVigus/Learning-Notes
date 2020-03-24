[Main TOC](../README.md)

# Object Oriented Programming

OOP is a way modelling and designing systems that focuses on objects, methods, data and how they interact with eachother.

## Abstraction

This is the idea of hiding complexity and giving a more abstract picture of the object. It is focused on the design level. For example, if you have a vehicle, you just tell it to move, not that it needs to move using tires that need to turn. You avoid talking about the details, focusing on what something does and not how it does it.

## Encapsulation

Encapsulation is focused on the implementation level and hiding the internal workings or implementation of methods and objects so you can change it without impacting on 'clients' that use the object. This is usually accomplished by implementing a public interface, hiding the implementation detail inside methods that clients don't have access to or need to see.

Encapsulation is often partly implemented by using private/public type accessor modifiers to methods and member data.

## Delegation

Delegation is when one class asks another for help. You delegate part if its responsibility to another class. It is used in the delegation pattern:

```ruby

class Report
	def records
		# lists report records
	end
	
	def print(delegate)
		delegate.generate(self.records)
	end
end

class CSVFormatter
	def generate(records)
		# format to CSV
	end
end

class XMLFormatter
	def generate(records
		# format to XML
	end	
end

# Report delegates the responsibility for printing to each of the formatter classes
report = Report.new
report.print(CSVFormatter.new)
report.print(XMLFormatter.new)
```

## Coupling and cohesion

Classes are tightly coupled if they are heavily dependent on each other, and loosly coupled if not. Tight coupling reduces code flexibility and can make testing and maintenance of the code difficult. It is difficult to unit test a class if it is tightly coupled to another class.

A class has high cohesion if everything inside it relates to the purpose of the class.

## Dependency injection

Dependency injection can be used to loosen the coupling between two classes, particularly if one is a high-level abstraction and one is low-level. This is particularly helpful when trying to test classes in isolation, as you can inject a double directly into a class as a dependency.

In the example below, Greeter is tightly coupled with Smiley, and there is no easy way of separating them so Greeter can be tested in isolation.

```ruby
class Greeter
	def greet
		smily = Smily.new
		"Hello #{smiley.get}|
	end
end

class Smiley
	def get
		":)"
	end
end
```

This is a reworked version that uses dependency injection to pass an instance of Smiley into the Greeter on initialisation. Now, when we unit test Greeter, we can pass a double of Smiley in, which completely breaks the dependency between the two classes.

```ruby
class Greeter
	def initialize(smiley = Smiley.new)
		@smiley = smiley
	end
	
	def greet()
		"Hello #{smiley.get}
	end 
end

class Smiley
	def get
		":)"
	end
end
```

You can also inject actual classes in rather than class instances. This allows you to create instances of an injected class directly as required.

## Concretes and abstracts

## Polymorphism

## Extracting classes

## Inheritence and composition