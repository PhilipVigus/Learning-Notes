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
