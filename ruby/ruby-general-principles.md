[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)
# Ruby general principles
- Ruby is a dynamically typed language, which means that types are defined at runtime rather than explicitly in code

 	
- Everything in Ruby is an object, which means you can do things like this:
```
# 5 is an object here, and has it's own instance methods
5.times do 
	puts "wibble"
end
```