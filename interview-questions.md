# Interview questions

## JavaScript

1. Explain event delegation

   Event delegation is a technique where the responsibility for handling events within the DOM is given to the parent of a number of children where the event originates rather than being handled by the children themselves. Doing this means you limit the number of event handlers that need to be attached. It makes use of event bubbling to work.

2. Explain 'this' in Javascript

   - 'this' relates to the context of a function call.
   - If the function is a property on an object (so it is a method on that object), 'this' usually points to the owning object, and the function is called with obj.func(args).
   - If the function is not attached to an object, 'this' points either to the global context or is undefined if strict mode is applied.
   - Alone, it refers to the global object.
   - In an event it refers to the element that received the event.
   - Within a class, all non-static methods are added to the prototype of whatever 'this' is pointing to.
   - For a derived class, 'this' is undefined until super() is called.

3. Explain the difference between call, apply and bind

   - func.call(thisObj, arg1, arg2, arg3 etc);
   - func.apply(thisObj, [args]);
   - funcWithThis = func.bind(thisObj);

4. Explain prototypal inheritance

   - Every object has a prototype associated with it
   - Every prototype has a link to the next prototype in the 'chain', ending the the Object prototype (the [[prototype]] property, set with \_\_prototype\_\_)
   - When a function is called with the new keyword
     - an empty object is created
     - the object's prototype is set to that of the called function
     - 'this' is set to the new object
     - the new object is returned unless something else is explicitly returned
   - When an object is called with a method, and that method doesn't exist on the object, its prototype is checked for the same method. If it isn't found there, then the next prototype in the chain is checked etc etc
   - it's important to note that changing a prototype, for example by adding a method, also changes those objects that use that prototype. i.e. the connection is still 'live', even after the object is created

5. What's the difference between a variable that is: null, undefined or undeclared?

   - undeclared is when you try to use a variable that has not been previously declared with either var, let or const. Test with try..catch block
   - undefined is when a variable has been declared with var or let, but its value has not yet been set. Test with typeof 'undefined'
   - null is when a variable's value has explicitly been set to null. Test with var === 'null'

6. What is a closure, and how/why would you use one?

   - A closure applies when a function is called outside of the context in which it was created
   - Every function has a lexical environment, which includes all local variables in the scope that creates the function, and a link to the 'next' parent lexical environment
   - A closure allows a function to access its lexical environment (and the parents of that le etc), even when that environment has gone out of scope
   - A closure is created for each instance of a specific function
   - Closures can cause problems with garbage collection, so it's important to discard function references when they're no longer being used
   - Example uses - 'private' variables

7. What language constructions do you use for iterating over object properties and array items?

   - Standard for loop
   - forEach, map, select, filter, reduce - easy to access the current index
   - for...in - iterates over ALL properties, including non-numeric
   - for...of - most robust approach, only iterates over numeric properties, hard to access the current index, doesn't skip empty elements

8. Can you describe the main difference between the Array.forEach() loop and Array.map() methods and why you would pick one versus the other?

   - forEach - calls the specified function on each of the elements in the array in turn. Returns undefined, so is not chainable
   - map - calls the specified function on each element, converting the element to whatever the function returns. Returns a new array with the changed elements. Chainable

9. What's a typical use case for anonymous functions?

   - Passed as callbacks into methods that iterate over arrays and objects

10. What's the difference between host objects and native objects?

    - native objects are defined by the ECMAScript specification, e.g. String, Array
    - host objects are defined by the hosting environment, e.g. Window, Element

11. Explain the difference between: function Person(){}, var person = Person(), and var person = new Person()?

    - function Person() {} - a function declaration. Is hoisted to the top of function scope. Called with Person()
    - var person = Person() {} - a function expression. Not hoisted (avoids polluting global scope?). Called with person(). Can omit the function name to create an anonymous function. Can be used as part of an IIFE.
    - var person = new Person() - creates a new object, assigns the prototype of Person to it, sets 'this' to point to the new object, returns the new object

12. What's the difference between feature detection, feature inference, and using the UA string?

    - feature detection - uses JS to establish whether the environment has access to a particular feature, eg local storage
    - feature inference - uses existing features that have been established as available to infer the existence of other features
    - UA (userAgent) string - gives information about the browser and system

13. Explain "hoisting"

    - when variables are moved to the top of their 'scoped context' as part of compilation before code is run
      - var - hoisted to top of function (or global) context
      - let - hoisted to top of block
      - const - hoisted to top of block
      - function declaration - hoisted to top of function

14. Describe event bubbling and event capturing

    - when an event is triggered, it starts on the element highest in the dom, trickles down to the lowest, and bubbles back up again. Capturing takes place during the down phase, and bubbling is the up phase (and default)

15. What's the difference between an "attribute" and a "property"?

    - attributes exist in HTML
    - properties exist on the DOM and are accessible through JavaScript
    - most default attributes have property equivalents, and the two are usually kept in sync

16. What are the pros and cons of extending built-in JavaScript objects?

    - Generally considered a bad thing
      - breaks default functionality
      - JS might provide that functionality in the future, overriding yours
      - can affect other, 3rd party libraries
      - overwriting existing functionality is 'silent' and not necessarily clear to other users or your code

17. What is the difference between == and ===?

    - == - loose equality. If the two sides are not the same type, then performs implicit coercion before comparison
      - 2 == '2' // true
      - avoid if possible, as there are some difficult to predict results
        - NaN == NaN // false
        - 4 + [1, 2] = "41, 2"
        - 4 \* [1, 2] = NaN
        - true + true = 2
        - etc
    - === - strict equality. The two sides must be the same type

18. What are truthy and falsy values?

    - falsy
      - false, 0, "", null, undefined, NaN
      - values that coerce to false when used as a boolean value
    - truthy
      - anything else

19. Explain the same-origin policy with regards to JavaScript.

    - A script can interact with content and properties that have the same origin as the page that contains the script. The policy restricts based on the origin of the content rather than the origin of the script
    - same origin
      - protocol + port + host must all be the same
      - http://www.example.com/bar === http://www.example.com/foo
    - embedding a cross origin resource is usually allowed
      - iframes
      - css
      - forms
      - images
      - multimedia
      - scripts (with restrictions)

20. Why is it called a Ternary operator, what does the word "Ternary" indicate?

    - ternary relates to the 3 arguments that the operator takes
      - condition ? do_if_true : do_if_false

21. What is strict mode? What are some of the advantages/disadvantages of using it?

    - invoke with 'use strict'; either at the top of a script, within an individual function, or as part of a module export
    - changes it enforces
      - you cannot accidentally create global variables (ie, using a variable without declaring it with const, let or var throws an error)
      - you cannot delete variables
      - turns silently-failing code into errors
        - assigning to non-writable globals like undefined
        - assigning to non-writable properties
        - assignment to getters
      - attempting to delete undeletable objects throws an exception
      - function parameter names must be unique
      - you cannot set properties on primitive values
      - prohibits use of the with keyword
      - prevents eval introducing new variables into the surrounding scope
      - the this value is no longer 'boxed'. This means it's no longer forced to be a value, which is important for browsers. Without strict, this outside of the context of a function will point to Window, which is a security flaw. With strict, it will be undefined
      - it prohibits the use of keywords that will be used in future versions of Javascript

22. What are some of the advantages/disadvantages of writing JavaScript code in a language that compiles to JavaScript?

    - addition of features such as classes, OOP, strong typing
    - makes the pipeline more complex, requiring babel, webpack, gulp etc

23. What tools and techniques do you use debugging JavaScript code?

    - read the error message, tighten the loop, get visibility, fix the bug
    - console.log
    - react/redux extensions
    - chrome dev tools/VS Code
      - break points, watches etc

24. Explain the difference between mutable and immutable objects.

    - mutable objects can have their state changed after creation, immutable ones cannot
    - objects are mutable, primitives are immutable
    - when you assign an immutable variable, it creates a copy. Changing the original does not change the copy
    - when you assign a mutable variable, it creates a reference. Changing the original also changes the copy
    - Object.freeze(obj) prevents reassigning properties on an object. This throws an error in strict mode, but just fails silently otherwise. However, it only freezes top-level properties and isn't 'deep'
    - spread syntax can be used to copy an object/arrays top level properties
    - Immer library (used by Redux), Immutable.js

25. What is the event loop

    - JavaScript is made up of a call stack, which keeps track of where you are in the execution of your code and a task queue. As JS is single-threaded, it can only do one thing at a time. For anything asynchronous it relies on webAPIs, which are provided by either the browser or node
    - Functions are pushed onto the call stack, and popped off when they finish executing
    - Asynchronous code triggers a call to the relevant webAPI, while the call stack continues to execute
    - When the webAPI is complete, it pushes the result onto the task queue (it doesn't push straight back onto the call stack, as this could produce strange/corrupt results)
    - The event loop checks the task queue whenever the call stack is empty. If there is something in the queue, it will dequeue the first item there and push it onto the call stack to be executed
    - It is really important to note that items in the queue are only ever executed when the call stack is empty.

26. What are the differences between variables created using let, var or const?

    - var - earliest. Hoisted to function scope, or global if outside of a function. Can be redeclared
    - let - introduced as part of ES6. Hoisted to block scope (but not initialised), can be updated but not redeclared
    - const - introduced as part of ES6. Hoisted to block scope, must be initialised to a value at declaration. Cannot be updated or redeclared. Does not extend to 'deep' const-ness

27. What are the differences between ES6 class and ES5 function constructors?

    - class constructors are largely syntactic sugar for ES5 function constructors. The main difference is in the way they handle inheritance. The use of ES6 extends keyword automatically wires up the prototypes between the sub and super classes, so you don't have to manually do anything. The only thing you do have to make sure you do is call super().

```js
// ES5 Function Constructor
function Student(name, studentId) {
  // Call constructor of superclass to initialize superclass-derived members.
  Person.call(this, name);
  // Initialize subclass's own members.
  this.studentId = studentId;
}
Student.prototype = Object.create(Person.prototype);
Student.prototype.constructor = Student;

// ES6 Class
class Student extends Person {
  constructor(name, studentId) {
    super(name);
    this.studentId = studentId;
  }
}
```

28. Can you offer a use case for the new arrow => function syntax? How does this new syntax differ from other functions?

    - anonymous functions, useful for callbacks
    - Don't set the 'this' context, it stays the same as the outer context
    - don't need to return if it only has one expression, as it is implicitly returned

29. What advantage is there for using the arrow syntax for a method in a constructor?

- 'this' is the same in the arrow function and constructor

30. What is the definition of a higher-order function?

    - Functions that receive functions as arguments and/or return functions
    - Allow actions to be abstracted and passed into and out of other functions

31. Can you give an example for destructuring an object or an array?

    - Used extensively with React

```js
const { id } = { id: 3, name: "Phil", age: 23 }; // id === 3
const [a, b] = [1, 2, 3, 4]; // a === 1, b === 2
```

32. Can you give an example of generating a string with ES6 Template Literals?

```js
const name = "Bob";
const message = `Hi ${name}, how are you doing?`; //-> Hi Bob, how are you doing?
```

33. Can you give an example of a curry function and why this syntax offers an advantage?

    - Curry transforms a function from f(a, b, c) to f(a)(b)(c)
    - Currying allows functions to be partially run, producing 'convenience' versions with some of the arguments set

```js
function curry(f) {
  // curry(f) does the currying transform
  return function (a) {
    return function (b) {
      return f(a, b);
    };
  };
}
```

34. What are the benefits of using spread syntax and how is it different from rest syntax?

- rest syntax collects all remaining function arguments into an array. Prior to this the arguments keyword was needed, which returned an array-like structure but not an actual array. Arguments also cannot be used in arrow functions, as there is no this context set

```js
function add(...args) {
  let result = 0;

  for (let arg of args) result += arg;

  return result;
}
```

    - the spread operator 'spreads' the elements of an array into a new array, and can be used to make a copy of an array

```js
const arr = ["Joy", "Wangari", "Warugu"];
const newArr = ["joykare", ...arr];
```

35. How can you share code between files?

- module pattern with IIFE

```js
const mod = (() => {
  let privateVar = 0;

  const privateFunc = () => {};

  return {
    pubFunc1: () => {},
    pubFunc2: () => {},
  };
})();
```

- ES6 modules with exports and imports
- node modules
