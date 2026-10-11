/*
 * Modern C syntax reference: practical examples for everyday use.
 *
 * Main examples are written to compile cleanly as C17 for broad portability.
 * A C23 notes section at the end highlights important current-standard additions.
 */

#include <errno.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ARRAY_LEN(array) (sizeof(array) / sizeof((array)[0]))
#define MAX_NAME_LENGTH 31

typedef struct {
    char name[MAX_NAME_LENGTH + 1];
    int age;
} Person;

typedef enum {
    STATUS_IDLE,
    STATUS_RUNNING,
    STATUS_DONE
} Status;

typedef union {
    int integer;
    double decimal;
} NumberValue;

static int add(int a, int b) {
    return a + b;
}

static void greet(const char *name) {
    printf("Hello, %s!\n", name);
}

static int compare_ints(const void *left, const void *right) {
    const int a = *(const int *)left;
    const int b = *(const int *)right;
    return (a > b) - (a < b);
}

static void increment(int *value) {
    if (value != NULL) {
        (*value)++;
    }
}

int main(void) {
    /* ========================================================
     * 1. OUTPUT, INPUT, COMMENTS
     * ======================================================== */

    printf("Hello, world!\n");
    puts("puts() adds a newline automatically.");

    /* scanf() input example:
    int user_age;
    printf("Age: ");
    if (scanf("%d", &user_age) == 1) {
        printf("You entered %d\n", user_age);
    }
    */

    /* Safer line-based text input with fgets():
    char line[100];
    if (fgets(line, sizeof line, stdin) != NULL) {
        line[strcspn(line, "\n")] = '\0';
        printf("You entered: %s\n", line);
    }
    */

    // C99 and later also allow // single-line comments.

    /* ========================================================
     * 2. VARIABLES AND BASIC DATA TYPES
     * ======================================================== */

    char letter = 'C';
    signed int temperature = -5;
    unsigned int count = 42U;
    long population = 1000000L;
    long long huge_number = 9000000000LL;
    float ratio = 0.5F;
    double price = 4.99;
    long double precise = 3.141592653589793238L;
    bool is_ready = true;
    const int DAYS_PER_WEEK = 7;

    printf("%c %d %u %ld %lld %.1f %.2f %.3Lf %s %d\n",
           letter,
           temperature,
           count,
           population,
           huge_number,
           ratio,
           price,
           precise,
           is_ready ? "true" : "false",
           DAYS_PER_WEEK);

    /* Fixed-width integer types from <stdint.h>. */
    int32_t signed_32 = INT32_C(123456);
    uint64_t unsigned_64 = UINT64_C(9876543210);
    printf("int32=%" PRId32 ", uint64=%" PRIu64 "\n", signed_32, unsigned_64);

    /* sizeof returns size_t; print it with %zu. */
    printf("sizeof(int) = %zu bytes\n", sizeof(int));

    /* ========================================================
     * 3. OPERATORS
     * ======================================================== */

    int sum = 5 + 2;
    int difference = 5 - 2;
    int product = 5 * 2;
    int integer_division = 5 / 2;   /* 2 */
    double real_division = 5.0 / 2; /* 2.5 */
    int remainder = 5 % 2;

    int score = 10;
    score += 5;
    score--;

    /* Comparisons: == != < <= > >=
       Logical:     && || !
       Bitwise:     & | ^ ~ << >>
       Assignment:  = += -= *= /= %= &= |= ^= <<= >>=
    */

    unsigned int flags = 0U;
    flags |= 1U << 2;              /* set bit 2 */
    bool bit_is_set = (flags & (1U << 2)) != 0U;

    printf("%d %d %d %d %.1f %d %d %s\n",
           sum,
           difference,
           product,
           integer_division,
           real_division,
           remainder,
           score,
           bit_is_set ? "set" : "not set");

    /* ========================================================
     * 4. CONDITIONALS AND SWITCH
     * ======================================================== */

    int age = 28;

    if (age >= 18) {
        puts("Adult");
    } else if (age >= 13) {
        puts("Teen");
    } else {
        puts("Child");
    }

    const char *category = age >= 18 ? "adult" : "minor";
    printf("Category: %s\n", category);

    Status status = STATUS_RUNNING;
    switch (status) {
        case STATUS_IDLE:
            puts("Idle");
            break;
        case STATUS_RUNNING:
            puts("Running");
            break;
        case STATUS_DONE:
            puts("Done");
            break;
        default:
            puts("Unknown status");
            break;
    }

    /* ========================================================
     * 5. LOOPS
     * ======================================================== */

    for (int i = 0; i < 3; i++) {
        printf("for: %d\n", i);
    }

    int while_count = 0;
    while (while_count < 3) {
        while_count++;
    }

    do {
        while_count--;
    } while (while_count > 0);

    for (int i = 0; i < 10; i++) {
        if (i == 2) {
            continue;
        }
        if (i == 5) {
            break;
        }
        printf("loop value: %d\n", i);
    }

    /* ========================================================
     * 6. FUNCTIONS
     * ======================================================== */

    greet("Corbie");
    printf("2 + 3 = %d\n", add(2, 3));

    /* C passes arguments by value. Use a pointer when a function needs
       to modify the caller's object. */
    int level = 4;
    increment(&level);
    printf("level = %d\n", level);

    /* ========================================================
     * 7. ARRAYS
     * ======================================================== */

    int numbers[] = {30, 10, 40, 20};
    const size_t number_count = ARRAY_LEN(numbers);

    for (size_t i = 0; i < number_count; i++) {
        printf("numbers[%zu] = %d\n", i, numbers[i]);
    }

    /* Arrays usually decay to pointers when passed to functions.
       Pass the element count separately. */

    qsort(numbers, number_count, sizeof numbers[0], compare_ints);

    /* Two-dimensional array. */
    int grid[2][3] = {
        {1, 2, 3},
        {4, 5, 6}
    };
    printf("grid[1][2] = %d\n", grid[1][2]);

    /* ========================================================
     * 8. STRINGS
     * ======================================================== */

    /* C strings are char arrays terminated by '\0'. */
    char text[64] = "Hello";
    const char *suffix = " C";

    const int written = snprintf(text + strlen(text),
                                 sizeof text - strlen(text),
                                 "%s",
                                 suffix);
    if (written < 0) {
        fputs("Formatting failed\n", stderr);
    }

    printf("%s has length %zu\n", text, strlen(text));

    if (strcmp(text, "Hello C") == 0) {
        puts("Strings match");
    }

    char copy[64];
    snprintf(copy, sizeof copy, "%s", text);
    printf("Copied string: %s\n", copy);

    /* Never use gets(); it was removed from the C standard because it
       cannot prevent buffer overflow. Prefer fgets() for line input. */

    /* ========================================================
     * 9. POINTERS AND NULL
     * ======================================================== */

    int value = 42;
    int *pointer = &value;          /* address-of */
    printf("value=%d, pointed=%d\n", value, *pointer); /* dereference */

    *pointer = 99;
    printf("value is now %d\n", value);

    int *maybe_pointer = NULL;
    if (maybe_pointer == NULL) {
        puts("Pointer is null");
    }

    /* Pointer arithmetic moves in units of the pointed-to type. */
    int *first_number = numbers;
    printf("first=%d second=%d\n", *first_number, *(first_number + 1));

    /* ========================================================
     * 10. STRUCTS, ENUMS, UNIONS, TYPEDEF
     * ======================================================== */

    Person person = {"Corbie", 28};
    printf("%s is %d\n", person.name, person.age);

    Person *person_ptr = &person;
    person_ptr->age = 29;
    printf("Updated age: %d\n", person_ptr->age);

    NumberValue number_value;
    number_value.decimal = 3.5; /* only the most recently written member is active */
    printf("union decimal = %.1f\n", number_value.decimal);

    /* ========================================================
     * 11. DYNAMIC MEMORY
     * ======================================================== */

    size_t item_count = 5;
    int *dynamic_numbers = malloc(item_count * sizeof *dynamic_numbers);

    if (dynamic_numbers == NULL) {
        fputs("Allocation failed\n", stderr);
        return EXIT_FAILURE;
    }

    for (size_t i = 0; i < item_count; i++) {
        dynamic_numbers[i] = (int)(i * 10);
    }

    int *resized = realloc(dynamic_numbers, 8 * sizeof *dynamic_numbers);
    if (resized != NULL) {
        dynamic_numbers = resized;
        item_count = 8;
    }

    printf("allocated items = %zu\n", item_count);
    free(dynamic_numbers);
    dynamic_numbers = NULL;

    /* calloc(count, size) allocates zero-initialized storage. */

    /* ========================================================
     * 12. FILE I/O
     * ======================================================== */

    /*
    FILE *file = fopen("example.txt", "w");
    if (file == NULL) {
        perror("fopen");
    } else {
        fprintf(file, "Hello from C!\n");
        if (fclose(file) == EOF) {
            perror("fclose");
        }
    }

    file = fopen("example.txt", "r");
    if (file != NULL) {
        char line[128];
        while (fgets(line, sizeof line, file) != NULL) {
            fputs(line, stdout);
        }
        fclose(file);
    }
    */

    /* fopen modes: "r" read, "w" overwrite/create, "a" append,
       add "b" for binary mode where relevant: "rb", "wb", "ab". */

    /* ========================================================
     * 13. CONVERTING TEXT TO NUMBERS
     * ======================================================== */

    const char *number_text = "123";
    char *end = NULL;
    errno = 0;
    long parsed = strtol(number_text, &end, 10);

    if (errno == 0 && end != number_text && *end == '\0') {
        printf("Parsed number: %ld\n", parsed);
    }

    /* Prefer strtol/strtoul/strtod when you need error checking.
       atoi/atol/atof do not provide useful conversion error reporting. */

    /* ========================================================
     * 14. PREPROCESSOR BASICS
     * ======================================================== */

    /*
    #include <stdio.h>       // system header
    #include "my_header.h"  // project header

    #define BUFFER_SIZE 256

    #if defined(DEBUG)
        fprintf(stderr, "debug mode\n");
    #endif
    */

    /* Prefer typed constants (const or enum) over macros when a macro is
       not actually needed. Macro arguments are textual substitutions. */

    /* ========================================================
     * 15. COMMON HEADER FILES
     * ======================================================== */

    /* <stdio.h>    input/output and FILE
       <stdlib.h>   allocation, conversions, qsort, EXIT_SUCCESS
       <string.h>   strlen, strcmp, memcpy, memmove, memset
       <stdint.h>   fixed-width integer types
       <inttypes.h> printf/scanf macros for fixed-width integers
       <stdbool.h>  bool/true/false compatibility for pre-C23 code
       <stddef.h>   size_t, ptrdiff_t, NULL
       <math.h>     mathematical functions
       <ctype.h>    character classification/conversion
       <time.h>     date/time utilities
       <errno.h>    errno and error codes
       <assert.h>   assert and static assertion facilities
    */

    /* ========================================================
     * 16. MEMORY / BUFFER SAFETY REMINDERS
     * ======================================================== */

    /* - C does not automatically bounds-check arrays.
       - Never read or write outside an object's valid bounds.
       - Always leave room for the '\0' terminator in C strings.
       - Check allocation and I/O results before using them.
       - Match every successful malloc/calloc/realloc allocation with free().
       - Do not use memory after free().
       - Do not return a pointer to a non-static local variable.
       - sizeof(pointer) is the size of the pointer, not the allocated block.
       - memcpy is for non-overlapping regions; use memmove if they overlap.
    */

    /* ========================================================
     * 17. CURRENT STANDARD: C23 QUICK NOTES
     * ======================================================== */

    /* The current ISO C standard is C23, published as ISO/IEC 9899:2024.
       This file's executable examples stay C17-compatible for portability.

       Important C23 additions/changes include:

       - bool, true, and false are language keywords.
       - nullptr is a dedicated null pointer constant.
       - nullptr_t is provided by <stddef.h>.
       - constexpr is available for constant objects.
       - typeof and typeof_unqual are standardized.
       - static_assert, alignas, alignof, and thread_local are keywords.
       - _BitInt(N) adds bit-precise integer types.
       - Binary integer literals: 0b1010.
       - Digit separators in numeric literals: 1'000'000.
       - Empty initialization: int values[10] = {};
       - Attributes use [[...]], including [[nodiscard]], [[deprecated]],
         [[maybe_unused]], [[fallthrough]], and [[noreturn]].
       - New preprocessor directives include #elifdef, #elifndef, #warning,
         and #embed.
       - Old-style function declarations/definitions were removed.
       - __STDC_VERSION__ is 202311L for C23 implementations.

       Compiler support varies by feature/version, so check your compiler's
       C23 support before relying on newer features in portable projects.
    */

    return EXIT_SUCCESS;
}
