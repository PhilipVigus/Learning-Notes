# Object Oriented Programming

- Organises software design around objects
- Objects have unique attributes and behaviour

### Benefits

- reusability of code
- scalability
- efficiency

## Principles

### SOLID

#### Single Responsibility Principle

A class should only have a single responsibility.

#### Open-closed Principle

Software entities should be closed for modification but open for extension. ie, you don't modify existing source code, instead extending it.

#### Liskov Substitution Principle

Objects should be replaceable with instances of their subtypes without changing the correctness of the program.

#### Interface Segregation Principle

Many client-specific interfaces are better than one all-purpose interface. No client should be forced to depend on methods it does not use.

#### Dependency Inversion Principle

Depend on abstractions, not concretions

- high-level modules should not depend on low-level modules. Both should depend on abstractions (e.g. interfaces)
- abstractions should not depend on details. Details (concrete implementations) should depend on abstractions

### Encapsulation

- Hiding private data within objects (data hiding), providing public interfaces to access data and affect the objects as appropriate

### Abstraction

- Objects only reveal internal mechanisms that other objects need to use the object, hiding unnecessary implementation code
- Allows the inner workings of a class to be changed without affecting the public interface

### Inheritance

- Classes can have parent-child relationships where a child inherits methods and data from the parent

### Polymorphism

- Objects are able to take on different forms depending on the context they are used in

## Criticisms

- Not enough focus on computation or algorithms
- More complex to write and longer to compile
- Composition over inheritance
  - classes should be polymorphic based on contained classes that implement common interfaces rather than behaviour inherited from parent classes
