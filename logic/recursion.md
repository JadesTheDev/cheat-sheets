# Recursion

**Recursion** happens when a function solves a problem by calling itself with a smaller version of that problem.

Every useful recursive solution needs two pieces:

1. A **base case** that stops the recursion.
2. A **recursive case** that moves the problem toward the base case.

## Example: factorial

```text
factorial(5)
= 5 × factorial(4)
= 5 × 4 × factorial(3)
= 5 × 4 × 3 × factorial(2)
= 5 × 4 × 3 × 2 × factorial(1)
= 5 × 4 × 3 × 2 × 1
```

Pseudocode:

```text
FUNCTION factorial(n)
    IF n <= 1
        RETURN 1
    ELSE
        RETURN n × factorial(n - 1)
    END IF
END FUNCTION
```

## Call stack idea

Each recursive call pauses while it waits for the deeper call to finish.

```text
factorial(4)
  factorial(3)
    factorial(2)
      factorial(1)
      return 1
    return 2
  return 6
return 24
```

## When recursion fits naturally

- Tree structures
- Folder/directory traversal
- Divide-and-conquer algorithms
- Problems defined in terms of smaller versions of themselves

## Recursion vs loops

Many recursive problems can also be solved with iteration.

Use recursion when it makes the structure of the problem clearer. Use a loop when iteration is simpler or when recursion depth could become a problem.

## Common failure

No reachable base case means the function keeps calling itself until the program runs out of allowed call depth or stack space.

```text
FUNCTION bad(n)
    RETURN bad(n + 1)
END FUNCTION
```

That is not recursion with a plan. That is a staircase into the abyss.
