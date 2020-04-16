# Learning a new language

## Translation

### Make a list of all the 'bits' of a language you do know
eg Ruby

- variable - let, const (and var - that you have no need to use any more)
- values
	- NaN, null, undefined 
- datatypes
	- number
		- Infinity/-Infinity
- automatic type conversion
	- be very careful. JS often does things you might not expect
- conditionals

```javascript
	if (var === val) {
		// do something funky
	} else if (var === val 2 {
		// do something slightly funky
	} else {
		// do something boring
	}
```

```javascript
	switch (a) {
	  case 1:
	    break;
	  case 2:
	    break;
	  case 3:
	    break;
	  case 4:
	    break;
	  case 5:
	  case 6:
	  case 7:
	    console.log("5, 6 or 7")
	    break;
	  default:
	    console.log("none of the above")
	}
```

- loops

```
while (a < b) {
	// do something
	continue;
}

do {
	// do something else
	break;
} while (a < b);

for (let i = 1; i < 10; i++ ) {
	// do something else again
}

```
- string
	- immutable in JS
	- similar methods
		- length, indexOf, lastIndexOf, search, slice, substr, substring, replace, toUpperCase, toLowerCase, charAt, trim, split 
- array
	- basically the same, but fewer built in functions, and no shovel operator 
	- represented as an object where the keys are sequential integers
- hash
	- closest thing in JS is an object 
- comments

```javascript
// single line
/*
	multi-line
*/
```
- classes
	- no equivalent
- functions

```javascript

// not hoisted
let f = function myFunction() {
	// do something functiony
};

// hoisted
function anotherFunction() {
	// do something functiony
}

// anonymous
let f = function() {
	// blargh
}

// lambda
let f = x => x * x;
let g = (x, y) => x * y;
let h = () => console.log("Hello");
```
- objects

```javascript
// an arbitary collection of properties
let obj = {
	squirrel: false,
	name: "Bob"
};

// "Bob"
obj.name
obj["name"]

// true
"name" in obj

// add a propert
obj["age"] = 21

// 21
obj.age

// undefined
delete obj.age
obj.age

// ["squirrel", "name"]
Object.keys(obj)
	
```
- objects and prototypes

```javascript
var cat = { sound: "meow!", legs: 4 };

console.log(cat.sound); // "meow!"
console.log(cat.legs); // 4

var dog = { sound: "woof!", legs: 4 };

console.log(dog.sound); // "woof!"
console.log(dog.legs); // 4

dog.sound = "bork!";

console.log(dog.sound); // "bork!"
```

```javascript
var sayHello = function() {
  return "Hello!";
};

sayHello(); // "Hello!"

var sayHi = function() {
  return "Hi!";
};

sayHi(); // Hi!
```

```javascript

var sayHello = function(name) {
  return "Hello " + name + "!";
};

sayHello("Fred"); // Hello Fred!
```

```javascript
var sayMeow = function() {
  return "Meow!";
};

sayMeow(); // Meow!

var cat = { legs: 4 };

cat.speak = sayMeow;

cat.speak(); // Meow!
```

```javascript
var cat = {
  speak: function() {
    return "Meow!";
  }
};

cat.speak(); // Meow!
```
```
var cat = {
  speak: function() {
    return "I have " + this.legs + " legs! Meow!";
  },
  legs: 4
};

cat.speak(); // I have 4 legs! Meow!
cat.legs = 5;
cat.speak(); // I have 5 legs! Meow!
```
```javascript
var myCatSpeak = function() {
  return "I have " + this.legs + " legs! Meow!";
};

var cat = {
  legs: 4
};

cat.speak = myCatSpeak;

cat.speak(); // I have 4 legs! Meow!
```

```javascript
var Cat = function(legs) {
  this.legs = legs;
};

Cat.prototype.speak = function() {
  return "I have " + this.legs + " legs! Meow!";
};

var cat = new Cat(4); // creates a new object, copying properties from the prototype
cat.speak(); // I have 4 legs! Meow!

var otherCat = new Cat(5);
otherCat.speak(); // I have 5 legs! Meow!

otherCat.legs = 6;
otherCat.speak(); // I have 6 legs! Meow!
```

```javascript
function Cat(legs) {
  this.legs = legs;
}

Cat.prototype.speak = function() {
  return "I have " + this.legs + " legs! Meow!";
};

var cat = new Cat(4);
cat.speak(); // I have 4 legs! Meow!
```

- scope
	- let and const are scoped to the block they're declared in
	- var is function scoped or global if not in a function
	- scopes have visibility of all outer-scopes (lexical scoping)
- arguments

```javascript
function sum(a, b) {
	return a + b;
}

// won't complain if you pass in too many
// prints 3
console.log(sum(1, 2, 3, 4);

// will complain if not enough as those not passed in are assigned undefined
console.log(sum 1);

// optional arguments work the same as for ruby
function multiply(a, b = 10) {
	return a * b;
}

// prints 20
console.log(multiply(2)

```
- implicit returns
	- not a thing 
- instance and class variables and methods
	- classes don't exist 
- self
	- the this keyword is similar but more complex 
- require, require_relative
	- complicated. Lots of alternatives depending on ES6, Node etc
- raise error
- ternary operator
	- same
- comparison operators
	- ==
		- don't use it unless you have to, as implicit type conversion has confusing and complicated results
	- ===
		- use it unless you have a good reason not to   
- attr_reader, writer, accessor
- initialize
	- classes don't exist
- predicate methods
	- no special naming
- nil
	- see undefined/null 
- logical operators
	- same
- symbols
	- introduced in ES6 
- enumerators, map, each
	- similar to Ruby
		- forEach, every, map
- iterators
	- introduced in ES6 
- blocks, procs and lambdas
	- => notation
	- this is scoped to the object that defined the arrow function
	- (with a normal function it's scoped to the object that called the function) 
- begin, rescue, ensure end
	- try/catch/throw/finally
- private
	- no equivalent (can do with closures though)
- string interpolation
	- with back-ticks 
- guard statements
	- normal ifs 
- constants and class constants
	- define variable with const keyword

