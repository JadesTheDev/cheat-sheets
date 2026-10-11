# Conditionals and Boolean Logic

Conditionals let a program choose between different paths.

## Boolean values

A Boolean has two possible states:

```text
TRUE
FALSE
```

A Boolean expression is any expression that evaluates to true or false.

```text
age >= 18
password == entered_password
balance < 0
```

## Comparisons

Common comparison ideas:

| Meaning | Typical symbol |
|---|---|
| Equal to | `==` |
| Not equal to | `!=` |
| Greater than | `>` |
| Less than | `<` |
| Greater than or equal to | `>=` |
| Less than or equal to | `<=` |

## Basic decision

```text
IF condition
    do something
END IF
```

## Two-way decision

```text
IF condition
    path A
ELSE
    path B
END IF
```

## Multiple choices

```text
IF score >= 90
    grade = A
ELSE IF score >= 80
    grade = B
ELSE IF score >= 70
    grade = C
ELSE
    grade = F
END IF
```

## Logical operators

### AND

Both conditions must be true.

```text
has_ticket AND age >= 18
```

### OR

At least one condition must be true.

```text
is_admin OR is_owner
```

### NOT

Reverses a Boolean value.

```text
NOT is_closed
```

## Nested decisions

A conditional can contain another conditional.

```text
IF logged_in
    IF is_admin
        show admin controls
    END IF
END IF
```

Nested decisions are useful, but too many levels can become hard to read.

## Truth table

| A | B | A AND B | A OR B |
|---|---|---|---|
| False | False | False | False |
| False | True | False | True |
| True | False | False | True |
| True | True | True | True |

`NOT True` becomes `False`, and `NOT False` becomes `True`.
