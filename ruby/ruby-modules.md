[Main TOC](../README.md) / [Ruby TOC](./ruby-TOC.md)

# Modules

Generic store-boxes for methods and constants

```ruby
module ModuleName
	A_CONSTANT = val
	def a_method
	end
end
```
- Use `require ‘module’` at the top of a file
- Use `include module` in a class so you don’t need scope operators
- Modules can be used to implement mixins for classes by including them in the class definition. This allows instances to use the module contents. To allow the class itself to use them, use extend module instead