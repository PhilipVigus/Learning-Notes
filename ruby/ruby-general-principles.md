[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)
# Ruby general principles
- Ruby is a dynamically typed language, which means that types are defined at runtime rather than explicitly in code
> If it walks like a duck and talks like a duck, it's a duck

 	This refers to duck typing, which means that objects in Ruby define their type by what they can and cannot do rather than a defined type or class.
 	
- Everything in Ruby is an object, which means you can do things like this:
```
# 5 is an object here, and has it's own instance methods
5.times do 
	puts "wibble"
end
```