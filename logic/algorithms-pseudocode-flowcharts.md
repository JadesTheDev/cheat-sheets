# Algorithms, Pseudocode, and Flowcharts

## Algorithm

An **algorithm** is a finite, ordered set of logical steps for completing a task.

Good algorithms are:

- Clear: each step has one meaning.
- Ordered: steps happen in the correct sequence.
- Complete: no required step is missing.
- Finite: the process can actually end.

Example problem: calculate gross pay.

```text
1. Get hours worked.
2. Get hourly pay rate.
3. Multiply hours by rate.
4. Display gross pay.
```

## Pseudocode

**Pseudocode** describes program logic without requiring the syntax of a real programming language. Use it to solve the problem first and translate it into code second.

```text
INPUT hours
INPUT pay_rate
SET gross_pay = hours * pay_rate
OUTPUT gross_pay
```

Pseudocode is especially useful for decisions and loops:

```text
IF age >= 18
    OUTPUT "Adult"
ELSE
    OUTPUT "Minor"
END IF
```

```text
FOR each item in cart
    ADD item price to total
END FOR
```

## Flowcharts

Common flowchart shapes:

| Shape | Meaning |
|---|---|
| Oval | Start / End |
| Parallelogram | Input / Output |
| Rectangle | Process / Calculation |
| Diamond | Decision / Branch |
| Arrow | Direction of flow |

A decision normally creates at least two paths, such as Yes/No or True/False.

## Program-development habit

A useful order is:

```text
Understand the task
        ↓
List requirements
        ↓
Design the algorithm
        ↓
Write pseudocode / flowchart
        ↓
Write code
        ↓
Fix syntax errors
        ↓
Test results
        ↓
Fix logic errors
```

**Syntax error:** the language rules were broken.

**Logic error:** the program runs, but produces the wrong result.
