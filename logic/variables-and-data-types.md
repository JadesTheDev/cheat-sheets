# Variables and Data Types

## Variable

A **variable** is a named reference to a value the program needs to remember.

```text
age = 28
price = 4.99
name = "Corbie"
```

The important idea is not the punctuation. It is:

```text
NAME → VALUE
```

Variables can usually be reassigned:

```text
score = 10
score = 25
```

## Assignment vs equality

These are different ideas:

```text
assignment:  put a value into a variable
comparison:  ask whether two values are equal
```

Many languages use `=` for assignment and `==` for equality, but the concept matters more than the symbol.

## Common data types

| Type | Purpose | Example |
|---|---|---|
| Integer | Whole numbers | `42` |
| Floating point | Decimal numbers | `4.99` |
| String | Text | `"hello"` |
| Boolean | True/false state | `true` |
| Null / None | No value | `null` |

## Type conversion

Sometimes data must change type before an operation makes sense.

```text
"42" → integer 42
42 → string "42"
7 → floating-point 7.0
```

User input is commonly received as text, even when the person typed a number.

## Naming

Good variable names describe what the value means:

```text
hourly_rate
customer_name
total_price
```

Poor names hide intent:

```text
x
thing
stuff2
```

## Constants

A **constant** is a value intended not to change while the program runs.

```text
TAX_RATE = 0.07
PI = 3.14159
```

Some languages enforce constants. Others use naming conventions.

## Scope preview

A variable's **scope** is the part of the program that can access it.

- Local variable: belongs to a limited block or function.
- Global variable: accessible across a larger portion of the program.

Prefer the smallest scope that does the job.
