/* C syntax reference: compact examples for everyday use. */

#include <stdio.h>
#include <stdbool.h>
#include <string.h>

typedef struct {
    char name[32];
    int age;
} Person;

int add(int a, int b) {
    return a + b;
}

void greet(const char *name) {
    printf("Hello, %s!\n", name);
}

int main(void) {
    /* ---------- OUTPUT / INPUT ---------- */
    printf("Hello, world!\n");

    /* Input example:
    int user_age;
    printf("Age: ");
    if (scanf("%d", &user_age) == 1) {
        printf("You entered %d\n", user_age);
    }
    */

    /* ---------- VARIABLES / DATA TYPES ---------- */
    int age = 28;
    double price = 4.99;
    char grade = 'A';
    bool is_ready = true;
    const char *name = "Corbie";

    /* Common printf specifiers:
       %d int, %f floating point, %c char, %s string, %zu size_t
    */
    printf("%s | %d | %.2f | %c | %s\n",
           name, age, price, grade, is_ready ? "true" : "false");

    /* ---------- OPERATORS ---------- */
    int sum = 2 + 3;
    int difference = 5 - 2;
    int product = 4 * 3;
    double quotient = 10.0 / 4.0;
    int remainder = 10 % 4;
    (void)sum;
    (void)difference;
    (void)product;
    (void)quotient;
    (void)remainder;

    /* Comparisons: == != < <= > >=
       Logic: && || !
       Increment/decrement: ++ --
    */

    /* ---------- CONDITIONALS ---------- */
    if (age >= 18) {
        printf("Adult\n");
    } else if (age >= 13) {
        printf("Teen\n");
    } else {
        printf("Child\n");
    }

    /* ---------- LOOPS ---------- */
    for (int i = 0; i < 5; i++) {
        printf("%d\n", i);
    }

    int count = 0;
    while (count < 3) {
        count++;
    }

    do {
        count--;
    } while (count > 0);

    /* ---------- FUNCTIONS ---------- */
    greet(name);
    printf("2 + 3 = %d\n", add(2, 3));

    /* ---------- ARRAYS ---------- */
    int numbers[] = {10, 20, 30, 40};
    size_t number_count = sizeof numbers / sizeof numbers[0];

    for (size_t i = 0; i < number_count; i++) {
        printf("numbers[%zu] = %d\n", i, numbers[i]);
    }

    /* ---------- STRINGS ---------- */
    char text[64] = "Hello";
    strncat(text, " C", sizeof text - strlen(text) - 1);
    printf("%s has length %zu\n", text, strlen(text));

    if (strcmp(text, "Hello C") == 0) {
        printf("Strings match\n");
    }

    /* ---------- STRUCTS ---------- */
    Person person = {"Corbie", 28};
    printf("%s is %d\n", person.name, person.age);

    /* ---------- POINTERS ---------- */
    int value = 42;
    int *pointer = &value;
    printf("value=%d, through pointer=%d\n", value, *pointer);

    /* ---------- FILE I/O ---------- */
    /*
    FILE *file = fopen("example.txt", "w");
    if (file != NULL) {
        fprintf(file, "Hello from C!\n");
        fclose(file);
    } else {
        perror("Could not open file");
    }
    */

    return 0;
}
