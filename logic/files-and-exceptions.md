# Files and Exceptions

Programs often need data to survive after the program ends. Files provide persistent storage.

## Basic file workflow

```text
OPEN file
READ or WRITE data
CLOSE file
```

Many modern languages provide a construct that closes the file automatically.

## Common file modes

| Mode idea | Purpose |
|---|---|
| Read | Get existing data |
| Write | Create/replace data |
| Append | Add data to the end |

## Reading strategies

### Read everything

Useful for small files.

```text
OPEN file
contents = READ ALL
CLOSE file
```

### Read line by line

Useful for larger text files or records.

```text
FOR each line IN file
    process line
END FOR
```

## Exceptions

An **exception** is an abnormal condition that interrupts normal execution.

Examples:

- File does not exist
- User entered text where a number was required
- Division by zero
- Network request failed

## Exception handling

```text
TRY
    risky operation
CATCH expected error
    handle the problem
END TRY
```

The goal is not to hide every error. It is to handle errors you reasonably expect and can respond to.

## Multiple error types

Different failures may need different responses.

```text
TRY
    open file
    convert data to number
CATCH file error
    tell user file could not be opened
CATCH conversion error
    tell user data was not numeric
END TRY
```

## Cleanup

Some operations require cleanup whether the operation succeeds or fails, such as closing files or releasing resources.

Many languages provide a `finally`, context-manager, `using`, or similar mechanism for this purpose.

## Good habit

Catch specific errors when possible. A giant catch-all can make real bugs disappear into the void, which is funny only until you are debugging at 2 a.m.
