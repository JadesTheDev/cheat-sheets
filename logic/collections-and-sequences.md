# Collections and Sequences

Collections let one variable hold multiple values.

## Sequence

A **sequence** stores values in an order so they can be accessed by position.

Examples include strings, arrays, lists, and tuples depending on the language.

```text
index:   0      1      2
value:  "A"   "B"   "C"
```

Many languages use zero-based indexing, so the first item is position `0`.

## List / dynamic array

Use when you need an ordered collection that can usually grow or change.

Common operations:

```text
add item
remove item
get item by index
replace item
find length
sort
loop over items
```

## Array

Traditionally, an array is a fixed-size ordered collection whose elements share a type. Exact rules vary by language.

## Tuple

An ordered collection intended not to change after creation.

Useful for a small fixed group of related values.

## Set

An unordered collection of unique values.

Useful for:

- Removing duplicates
- Membership checks
- Set operations such as union and intersection

## Dictionary / map

Stores **key → value** pairs.

```text
"name" → "CoffeeBean"
"age"  → 8
```

Use a map when you care about looking up a value by a meaningful key instead of a numeric position.

## String

A string is a sequence of characters.

Common string operations:

```text
length
indexing
slicing / substring
search
split
join
upper/lower case
trim whitespace
concatenation
```

## Iteration

Collections are commonly processed with a loop:

```text
FOR each item IN collection
    process item
END FOR
```

## Choosing a structure

Ask:

- Does order matter?
- Can values repeat?
- Do I need numeric positions or named keys?
- Does the collection need to change size?
- Do I need fast membership checks?

Pick the structure that matches the job instead of forcing every problem into a list.
