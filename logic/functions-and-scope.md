# Functions and Scope

A **function** is a named block of code that performs a specific task.

Functions help break a large program into smaller pieces that are easier to understand, test, reuse, and maintain.

## Basic function idea

```text
FUNCTION greet
    OUTPUT "Hello"
END FUNCTION
```

## Parameters and arguments

A **parameter** is a variable in the function definition.

An **argument** is the actual value passed into the function call.

```text
FUNCTION double(number)   ← number is a parameter
    RETURN number × 2
END FUNCTION

result = double(5)        ← 5 is an argument
```

## Return values

A function can send a result back to the code that called it.

```text
FUNCTION add(a, b)
    RETURN a + b
END FUNCTION
```

Use output/printing when you want to display something. Use a return value when another part of the program needs the result.

## Local scope

A variable created inside a function usually exists only inside that function.

```text
FUNCTION example
    local_value = 10
END FUNCTION
```

Keeping variables local reduces accidental interference between parts of a program.

## Global scope

A variable defined outside functions may be accessible from many places.

Globals can be useful for true program-wide constants, but mutable global state can make programs harder to debug.

## Decomposition

A good function usually has one clear responsibility.

Instead of:

```text
FUNCTION do_everything
```

prefer:

```text
get_input
validate_input
calculate_total
display_result
```

## Modules

A **module** groups related code, often functions and classes, into a separate file or namespace.

```text
program
├── input module
├── calculations module
└── output module
```

Modules make larger programs easier to organize and allow code reuse.
