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

4.
