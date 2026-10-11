# Objects and Inheritance

Object-oriented programming groups data and behavior together.

## Class

A **class** is a blueprint that describes what an object should contain and what it can do.

```text
CLASS Cat
    data: name, color
    behavior: speak(), sleep()
END CLASS
```

## Object / instance

An **object** is one specific instance created from a class.

```text
CoffeeBean = Cat
Mocha = Cat
```

Both are cats, but each object can have different data.

## Attributes

Attributes store an object's state.

```text
CoffeeBean.name = "CoffeeBean"
CoffeeBean.color = "black"
```

## Methods

Methods are functions associated with a class/object.

```text
CoffeeBean.speak()
```

## Constructor / initializer

A constructor or initializer sets up a new object's starting state.

```text
CREATE Cat(name, color)
```

Different languages spell constructors differently, but the concept is the same.

## Encapsulation

Encapsulation means keeping an object's internal data and behavior together and controlling how outside code interacts with it.

Instead of letting every part of a program manipulate everything directly, provide clear methods or properties.

## Inheritance

Inheritance lets a more specific class reuse and extend a more general class.

```text
Animal
├── Cat
├── Dog
└── Crow
```

`Animal` is the superclass/base class.

`Cat`, `Dog`, and `Crow` are subclasses/derived classes.

## Method overriding

A subclass can replace inherited behavior with its own version.

```text
Animal.speak() → generic sound
Dog.speak()    → woof
Crow.speak()   → caw
```

## Polymorphism

Polymorphism lets code treat different object types through a common interface.

```text
FOR each animal
    animal.speak()
END FOR
```

The same operation can produce different behavior depending on the object's actual type.

## Composition vs inheritance

Inheritance means **is a**:

```text
Dog is an Animal
```

Composition means **has a**:

```text
Car has an Engine
```

Use inheritance for genuine type relationships, not merely because two classes share some code.
