# Javascript

## When to use semi-colons

- when two statements are on the same line
- optional after a statement, but use them
- not after closing curly brackets unless it's an assignment statement
- not after round brackets in ifs, whiles, switch or for
- within for round brackets

## Strict mode

- invoke with `'use strict';` either at the top of a script, within an individual function, or as part of a module export
- changes it enforces
	- you cannot accidentally create global variables (ie, using a variable without declaring it with const, let or var throws an error)
	- you cannot delete variables
	- turns silently-failing code into errors
		- assigning to non-writable globals like undefined
		- assigning to non-writable properties
		- assignment to getters
		- etc
	- attempting to delete undeletable objects throws an exception
	- function parameter names must be unique
	- you cannot set properties on primitive values
	- prohibits use of the with keyword
	- prevents eval introducing new variables into the surrounding scope
	- the this value is no longer 'boxed'. This means it's no longer forced to be a value, which is important for browsers. Without strict, this outside of the context of a function will point to Window, which is a security flaw. With strict, it will be undefined
	- it prohibits the use of keywords that will be used in future versions of Javascript

## Functions

There are three common situations you encounter functions.

When they look like class declarations:

```javascript
function Dog() {
}

dog = new Dog();
```

Or blocks:

```javascript
[1, 2, 3].forEach(function(number) {
	console.log(number);
});

```

Or method definitions:

```javascript
dog = {};
dog.bark = function() {
	console.log("Woof");
};

dog.bark();
```

### What this actually means

A function creates an object that can be invoked, no more, no less. The way it is invoked is what is important.

#### Functions like classes

```javascript
function Dog(name) {
	// this points to the newly creted object in this case
	this.name = name;
}

// invoking with the new keyword makes the function behave in a specific way
// (it applies prototype properties and functions)
let buster = new Dog("Buster");
```

#### Functions like blocks

```javascript
// The function is anonymously passed into the forEach enumerator
// In this context, the function is often called a callback
[1, 2, 3].forEach( function(num) { console.log(num); });
```

#### Functions to define methods

```javascript
function Cat(name) {
	this.name = name;
}

Cat.prototype.meow = function() {
	console.log(`${this.name} says meow!`);
};

// kit is an object, a bag of properties that includes one called
// meow that just happens to be a function
kit = new Cat("Kit");
kit.meow(); // prints "Kit says meow!"

```




## Closures

A closure is a function bundled with its surrounding lexical environment. This means that a closure has access to local variables defined within that environment. It gives access to the outer function's scope and all outer scopes outside of that.

Lexical scoping is where the scope of a variable is determined by where it is defined.

Closures in JS are created every time a function is created.

### Examples:

```javascript
function makeCounter() {
  var n = 0;
  return function() {
    n = n + 1;
    return n;
  }
}

/*
makeCounter returns a closure that countains the anonymous
function and the lexical environment of the makeCounter
function. This means it has access to the n variable even
when the makeCounter function has stopped running.

*/
var counter = makeCounter();
console.log(counter()) // 1
console.log(counter()) // 2
console.log(counter()) // 3
```

```javascript
function counter(firstN) {
  var n = firstN;
  return function() {
    n = n + 1;
    return n;
  }
}

var counter = counter(5);
console.log(counter()) // 6
console.log(counter()) // 7
console.log(counter()) // 8
```
#### Factory pattern
```
function SecretDiary() {
  var locked = true,
      contents = "Hey!";
  
  function unlock() {
    locked = false;
  }
  
  function lock() {
    locked = true;
  }
  
  function read() {
    if (locked) { return "Nope!"; }
    return contents;
  }
  
  function write(message) {
    if (locked) { return "Nope!"; }
    contents = message;
  }
  
  // return an object with the set properties
  return {
    unlock: unlock,
    lock: lock,
    read: read,
    write: write
  };
}

// factory pattern, so doesn't use the new keyword
// calls the function, returns the object
var secretDiary = SecretDiary();
console.log(secretDiary.read()); // Nope!
secretDiary.unlock();
console.log(secretDiary.read()); // Hey!
```

```javascript
function makeAdder(x) {
  return function(y) {
    return x + y;
  };
}

// 'bakes in' the value of x
// note that the lexical environments of add5 and
add10 are different and not shared
var add5 = makeAdder(5);
var add10 = makeAdder(10);

console.log(add5(2));  // 7
console.log(add10(2)); // 12
```

### Emulating private variables

#### An example of the module pattern

```javascript
// An immediately invokable function expression
// The closure is created when it is invoked, which means
// the three functions defined inside all share the same
// lexical environment, (and the same privateCounter var
// and changeBy private function)
var counter = (function() {
  var privateCounter = 0;
  function changeBy(val) {
    privateCounter += val;
  }

  // defines the object that is returned
  // note that you don't return privateCounter
  // this makes it inaccessible other than in the 
  // closures made by the changeBy function
  return {
    increment: function() {
      changeBy(1);
    },

    decrement: function() {
      changeBy(-1);
    },

    value: function() {
      return privateCounter;
    }
  };
})(); // the important bit for an IIFE. This is invoked as soon as it is defined


console.log(counter.value());  // 0.

counter.increment();
counter.increment();
console.log(counter.value());  // 2.

counter.decrement();
console.log(counter.value());  // 1.
```

```javascript
// global scope
var e = 10;
// returns a function with a baked in
function sum(a){
  // returns a function with a and b baked in
  return function(b){
    // returns a function with a, b and c baked in
    return function(c){
      // outer functions scope
      // returns the result of all the baked in values
      return function(d){
        // local scope
        return a + b + c + d + e; // has access to all outter scopes
      }
    }
  }
}

console.log(sum(1)(2)(3)(4)); // log 20

// You can also write without anonymous functions:

// global scope
var e = 10;
function sum(a){
  return function sum2(b){
    return function sum3(c){
      // outer functions scope
      return function sum4(d){
        // local scope
        return a + b + c + d + e;
      }
    }
  }
}

var s = sum(1);
var s1 = s(2);
var s2 = s1(3);
var s3 = s2(4);
console.log(s3) //log 20
```

### Closures and loops - beware!!

In the example below, declaring item with var causes a problem. It gives item function scope, which means the three closures created in the for loop all share the same lexical environment. When the anonymous function assigned to each element's onfocus attribute is called, ie when onfocus is triggered, the for loop will have finished, with i set to 2 and pointing at the last element in the helpText array. This means all elements will show that last element.

```javascript
function showHelp(help) {
  document.getElementById('help').innerHTML = help;
}

function setupHelp() {
  var helpText = [
      {'id': 'email', 'help': 'Your e-mail address'},
      {'id': 'name', 'help': 'Your full name'},
      {'id': 'age', 'help': 'Your age (you must be over 16)'}
    ];

  for (var i = 0; i < helpText.length; i++) {
  	// var gives it function scope so the three closures created
  	// in the loop share the same LE
    var item = helpText[i];
    document.getElementById(item.id).onfocus = function() {
      showHelp(item.help);
    }
  }
}

setupHelp();
```

The simplest solution to the above problem is to declare the item variable with let instead of var. This gives it block scoping, which means each onfocus function gets its own lexical environment. These each have item.help set to the value at the time of creation, so everything works.

Other solutions utilise function factories:

```javascript
function makeHelpCallback(help) {
  return function() {
    showHelp(help);
  };
}

function setupHelp() {
  var helpText = [
      {'id': 'email', 'help': 'Your e-mail address'},
      {'id': 'name', 'help': 'Your full name'},
      {'id': 'age', 'help': 'Your age (you must be over 16)'}
    ];

  for (var i = 0; i < helpText.length; i++) {
    var item = helpText[i];
    document.getElementById(item.id).onfocus = makeHelpCallback(item.help);
  }
}
```

or anonymouse enclosures:

```javascript
  for (var i = 0; i < helpText.length; i++) {
    (function() {
       var item = helpText[i];
       document.getElementById(item.id).onfocus = function() {
         showHelp(item.help);
       }
    })(); // Immediate event listener attachment with the current value of item (preserved until iteration).
  }
```

You can also eliminate the item variable completely, iterating directly over helpText using forEach:

```javascript
function showHelp(help) {
  document.getElementById('help').innerHTML = help;
}

function setupHelp() {
  var helpText = [
      {'id': 'email', 'help': 'Your e-mail address'},
      {'id': 'name', 'help': 'Your full name'},
      {'id': 'age', 'help': 'Your age (you must be over 16)'}
    ];

  helpText.forEach(function(text) {
    document.getElementById(text.id).onfocus = function() {
      showHelp(text.help);
    }
  });
}

setupHelp();
```

## Asynchronous javascript

```javascript

// prints hello after 1 second
setTimeout(function() {
	console.log('hello')
}, 1000)

// also prints hello after 1 second
var callback = function() {
	console.log('hello')
}
setTimeout(callback, 1000)

// prints A, C, D, B
// setTimeout adds the callback to a queue
// the earliest it will get called is when
// the current task completes. It completes
// after D is logged
console.log('A')

var callback = function() {
	console.log('B')
}

console.log('C')

setTimeout(callback, 1000)

console.log('D')

// the same as the previous example
// the lack if delay makes no difference
console.log('A')

var callback = function() {
	console.log('B')
}

console.log('C')

setTimeout(callback, 0)

console.log('D')

// prints 10
// the console.log executes
// before the call to the
// anonymous function
var a = 10

var callback = function() {
	a = 20
}

setTimeout(callback, 1000)

console.log(a)

// same as previous example
var a = 10

var callback = function() {
	a = 20
}
setTimeout(callback, 0)

console.log(a)

// prints 20
var a = 10

var callback = function() {
	a = 20
	console.log(a)
}
setTimeout(callback, 0)

// does nothing
// by the time the callback
// executes, there's nothing
// to return to
var callback = function() {
	return "hello"
}
setTimeout(callback, 2000)
```

## Module pattern

### ES6 Modules

#### .js vs .mjs

Various sources suggest using the .mjs extension for files containing modules. This is because they are treated significantly differently compared to 'normal' javascript. However, this can cause issues with certain browsers that aren't set up to correctly handle the different file extension.

#### Exporting

You can export any top-level item, such as a class, function, constant or variable. To do so, just place the export keyword in front of them:

```javascript
export const name = "Phil";

export function add(a, b) {
  return a + b;
}
# Rather than adding individual export keywords as above
# you can do it with a summary line at the end of a file:
export { name, add };
```
Default exports:

```javascript
# at the end of the file
export default add;

# on the function itself (note the function is now anonymous)
export default function(a, b) {
  return a + b;
}
```

#### Importing

```javascript
# note that file extension is essential
import { name, add } from "./file/location.js";
```
Default imports:

```
import add from "./file/location.js";
```
Avoiding namespace clashes by renaming an import:

```
import { add as newAdd } from "./file/location.js";
```
Importing everything into a module object:

```javascript
# Module can be any variable name you want
import * as Module from "./file/location.js";

# Then
Module.add(1, 2);
Module.name;
```
Dynamic module loading:

```javascript
# Use 'import' as a function in a script
import("./module/location.js")
  .then( (module) => { // do something with the module } );
```

#### Applying a module to an HTML file

```html
<script type="module" src="./file/location.js"></script>
```

#### Things to watch out for

* trying to load an HTML file locally that imports a script will fail due to CORS security restrictions. You need to serve the file from a server
* modules use strict mode automatically, so you don't need to declare it
* modules are automatically deferred when loading into html
* modules are imported into the local scope of the script you import into, NOT globally

### Modules using IIFEs (immediately invokable function expressions)

An IIFE looks like this:

```javascript
(function() {
	console.log("Hello there");
})();

# You have an anonymous function
function() { console.log("Hello there"); }

# wrapped in brackets so that the interpretter sees what comes next as a function expression and not a function
(function() { console.log("Hello there"); })

# and finished off with double braces so that it gets evaluated immediately
(function() { console.log("Hello there"); })();
```
They can be used for various things, including hiding variable and functions that you want to be private.

#### An example module using an IIFE

```javascript
((exports) => { 
  let count = 0;
  
  function printTimesCalled() {
    count += 1;
    console.log(`I've been called ${count} times`);
  }
  
  exports.printTimesCalled = printTimesCalled;
} )(this);
```
Within a browser, this typically points to the global window object. It's passed into the IIFE, which adds printTimesCalled as a function on it. When you import the script in a script tag, it will immediately get executed, adding the printTimesCalled function to the global context and making it available.

## The event loop

JS runtime (eg V8 in chrome)

- callstack
- heap

WebAPIs sit outside of that, and are provided by the browser

- DOM
- ajax
- setTimeout
- etc

Callback queue

### Call stack

* JS is single threaded, has a single call stack and can do one thing at a time
* It records where in the program you are. If you step into a function it pushes it onto the stack, if you leave a function it pops it from the stack
* The stack trace is the state of the stack when an error happens

### Blocking

Code that is slow blocks when it is on the stack, as it's the only thing JS can run at that time
This is a problem for browsers, as it blocks user input and interaction, rendering etc

### Async callbacks

One solution
A function that is queued until a specified set of conditions are met then is called
eg. setTimeout

### Concurrency and the event loop

* Relies on more than just the JS runtime, ie the browser APIs
* The browser APIs provide the concurrency that the JS runtime cannot because of its lack of multithreading
* As an example, the browser handles setTimeout, keeping track of when to add the callback function specified in setTimeout to the task queue
* The webapis have to add stuff to thet task queue rather than straight onto the stack to prevent really weird interactions and corruption of the stack

* The event loop
	* Looks at the stack and the task queue
	* If the stack is empty it takes the first thing from the task queue and pushes it onto the stack (which effectively runs it)
* That last bit is really really important. The event loop will only ever move something from the task queue to the call stack if the call stack is empty

#### Ajax request example
* Ajax lives in an webapi
* When an ajax request is made, it is spun off into the webapi that handles it
* The webapi makes the request (concurrently)
* When the request is complete, the webapi moves the callback specified as part of the request onto the task queue
* This is then pushed onto the stack by the event loop the next time the stack is empty

#### Multiple setTimeout example

```javascript
setTimeout( () => {
	console.log("done");
}, 1000);

setTimeout( () => {
	console.log("done");
}, 1000);

setTimeout( () => {
	console.log("done");
}, 1000);

setTimeout( () => {
	console.log("done");
}, 1000);
```
The steps are as follows:

* Run the first setTimeout (pass it to the webapi, which waits for the timeout then push to callback queue)
* Run the second setTimeout
* Run the third setTimeout
* Run the fourth setTimeout

This means that the timeout time is a minimum time guarantee not an absolute. In this example, the fourth timeout callback will not run until 4 seconds have passed, even though the time specified is 1 second.

#### Rendering example

Rendering takes priority, but if the stack is blocked, render won't be given a chance

#### Flooding the callback queue
For example, doing a lot of scrolling triggers a ton of events that each get added to the queue. It's important when writing code to take this into consideration when writing code, and making sure that event processing is done in such a way as to not overwhelm the callback queue and event loop.


[http://latentflip.com/loupe/
](http://latentflip.com/loupe/?code=JC5vbignYnV0dG9uJywgJ2NsaWNrJywgZnVuY3Rpb24gb25DbGljaygpIHsKICAgIHNldFRpbWVvdXQoZnVuY3Rpb24gdGltZXIoKSB7CiAgICAgICAgY29uc29sZS5sb2coJ1lvdSBjbGlja2VkIHRoZSBidXR0b24hJyk7ICAgIAogICAgfSwgMjAwMCk7Cn0pOwoKY29uc29sZS5sb2coIkhpISIpOwoKc2V0VGltZW91dChmdW5jdGlvbiB0aW1lb3V0KCkgewogICAgY29uc29sZS5sb2coIkNsaWNrIHRoZSBidXR0b24hIik7Cn0sIDUwMDApOwoKY29uc29sZS5sb2coIldlbGNvbWUgdG8gbG91cGUuIik7!!!PGJ1dHRvbj5DbGljayBtZSE8L2J1dHRvbj4%3D)

