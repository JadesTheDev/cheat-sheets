# Loops

A **loop** repeats a statement or block of statements.

Use a loop when the same operation must happen more than once.

## Condition-controlled loop

Repeat while a condition remains true.

```text
WHILE balance > 0
    spend money
END WHILE
```

Best when you do not know exactly how many repetitions are needed.

## Count-controlled loop

Repeat a known number of times or once for each item in a sequence.

```text
FOR each student
    calculate grade
END FOR
```

## Counter

Tracks how many times something happens.

```text
count = 0
REPEAT
    count = count + 1
```

## Accumulator / running total

Collects a total over multiple iterations.

```text
total = 0
FOR each price
    total = total + price
END FOR
```

## Sentinel loop

A special value tells the loop to stop.

```text
INPUT value
WHILE value != "quit"
    process value
    INPUT value
END WHILE
```

The sentinel should be a value that cannot be confused with normal input.

## Input validation loop

Keep asking until the data is acceptable.

```text
INPUT age
WHILE age < 0
    OUTPUT "Invalid age"
    INPUT age
END WHILE
```

## Nested loops

A loop inside another loop.

```text
FOR each row
    FOR each column
        process cell
    END FOR
END FOR
```

If the outer loop runs `R` times and the inner loop runs `C` times, the inner body runs about `R × C` times.

## Break and continue

- **break**: exit the loop immediately.
- **continue**: skip the rest of the current iteration and move to the next one.

## Infinite loop warning

A condition-controlled loop must eventually change something that can make its condition false.

```text
WHILE count < 10
    # If count never changes, this never ends.
END WHILE
```
