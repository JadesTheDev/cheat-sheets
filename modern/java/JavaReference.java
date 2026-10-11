// Modern Java reference: practical examples for everyday use.
// Main examples target Java 21+ for broad modern compatibility.
// Java SE 27 is current as of September 2026; notes at the end flag newer/current features.

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Scanner;
import java.util.Set;
import java.util.stream.Collectors;

public class JavaReference {

    // ============================================================
    // 1. CLASSES / RECORDS / ENUMS
    // ============================================================

    static class Animal {
        private final String name;

        Animal(String name) {
            this.name = name;
        }

        String getName() {
            return name;
        }

        String speak() {
            return name + " makes a sound.";
        }
    }

    static class Cat extends Animal {
        Cat(String name) {
            super(name);
        }

        @Override
        String speak() {
            return getName() + " says meow.";
        }
    }

    record Point(int x, int y) {}

    enum Status {
        IDLE,
        RUNNING,
        DONE
    }

    interface Greeter {
        String greet(String name);
    }

    static int add(int a, int b) {
        return a + b;
    }

    static double divide(double a, double b) {
        if (b == 0.0) {
            throw new IllegalArgumentException("Cannot divide by zero.");
        }
        return a / b;
    }

    // ============================================================
    // 2. PROGRAM ENTRY POINT
    // ============================================================

    public static void main(String[] args) {

        // ============================================================
        // 3. OUTPUT / INPUT / COMMENTS
        // ============================================================

        System.out.println("Hello, world!");
        System.out.print("Same line");
        System.out.printf(" | value = %d%n", 42);

        // Console input:
        // try (Scanner scanner = new Scanner(System.in)) {
        //     System.out.print("Name: ");
        //     String input = scanner.nextLine();
        // }

        // Single-line comment
        /* Multi-line comment */

        // ============================================================
        // 4. VARIABLES / PRIMITIVE TYPES / REFERENCES
        // ============================================================

        byte small = 100;
        short medium = 30_000;
        int age = 28;
        long population = 8_000_000_000L;
        float ratio = 1.5F;
        double price = 4.99;
        char grade = 'A';
        boolean isReady = true;

        String name = "Corbie";     // reference type
        String maybeName = null;    // references can be null

        final double TAX_RATE = 0.07; // cannot be reassigned
        var inferred = 42;            // local variable type inference; still statically typed

        System.out.println(small + medium + age + population + ratio + price + grade + inferred);
        System.out.println(isReady + " " + maybeName + " " + TAX_RATE);

        // ============================================================
        // 5. OPERATORS / CONVERSIONS
        // ============================================================

        int sum = 2 + 3;
        int difference = 5 - 2;
        int product = 4 * 3;
        double quotient = 10.0 / 4.0;
        int integerDivision = 10 / 4; // 2
        int remainder = 10 % 4;

        int count = 10;
        count += 2;
        count++;
        count--;

        // Comparison: == != < <= > >=
        // Logic: && || !
        // Bitwise: & | ^ ~ << >> >>>

        int parsed = Integer.parseInt("123");
        String numberText = String.valueOf(parsed);
        double widened = age;      // int -> double automatically
        int narrowed = (int) 4.9; // explicit cast; becomes 4

        System.out.println(sum + difference + product + quotient + integerDivision + remainder);
        System.out.println(numberText + widened + narrowed);

        // ============================================================
        // 6. CONDITIONALS / SWITCH
        // ============================================================

        String category;

        if (age >= 18) {
            category = "adult";
        } else if (age >= 13) {
            category = "teen";
        } else {
            category = "child";
        }

        String shortCategory = age >= 18 ? "adult" : "minor";

        int day = 2;
        String dayName = switch (day) {
            case 1 -> "Monday";
            case 2 -> "Tuesday";
            case 3 -> "Wednesday";
            default -> "Other";
        };

        System.out.println(category + " " + shortCategory + " " + dayName);

        // ============================================================
        // 7. LOOPS
        // ============================================================

        for (int i = 0; i < 5; i++) {
            System.out.println(i);
        }

        int loopCount = 0;
        while (loopCount < 3) {
            loopCount++;
        }

        do {
            loopCount--;
        } while (loopCount > 0);

        int[] values = {1, 2, 3};
        for (int value : values) {
            System.out.println(value);
        }

        for (int i = 0; i < 10; i++) {
            if (i == 2) continue;
            if (i == 5) break;
            System.out.println(i);
        }

        // ============================================================
        // 8. METHODS / PARAMETERS / VARARGS
        // ============================================================

        System.out.println(add(2, 3));
        System.out.println(total(10, 20, 30));

        // Java passes arguments by value.
        // For object references, the reference value is copied.

        // ============================================================
        // 9. ARRAYS
        // ============================================================

        int[] numbers = {10, 20, 30};
        int firstNumber = numbers[0];
        int length = numbers.length;
        numbers[1] = 25;

        for (int number : numbers) {
            System.out.println(number);
        }

        System.out.println(firstNumber + length);

        // ============================================================
        // 10. COLLECTIONS
        // ============================================================

        List<String> names = new ArrayList<>();
        names.add("CoffeeBean");
        names.add("Mocha");
        names.add(1, "Crow");
        names.remove("Crow");

        Map<String, Integer> scores = new HashMap<>();
        scores.put("A", 100);
        scores.put("B", 90);

        Set<String> tags = Set.of("java", "reference"); // immutable set
        List<Integer> immutableNumbers = List.of(1, 2, 3); // immutable list
        Map<String, Integer> immutableMap = Map.of("one", 1, "two", 2);

        System.out.println(names.get(0));
        System.out.println(scores.getOrDefault("C", 0));
        System.out.println(tags + " " + immutableNumbers + " " + immutableMap);

        for (Map.Entry<String, Integer> entry : scores.entrySet()) {
            System.out.println(entry.getKey() + " -> " + entry.getValue());
        }

        // ============================================================
        // 11. STRINGS
        // ============================================================

        String text = "  Hello Java  ";
        String clean = text.trim();
        String upper = clean.toUpperCase();
        boolean contains = clean.contains("Java");
        String[] parts = clean.split("\\s+");
        String joined = String.join("-", "a", "b", "c");
        String formatted = "%s is %d years old.".formatted(name, age);

        System.out.println(upper + contains + parts.length + joined + formatted);

        // IMPORTANT: == compares references for objects; use .equals() for content.
        if (name.equals("Corbie")) {
            System.out.println("Names match");
        }

        // Null-safe content comparison:
        if ("Corbie".equals(maybeName)) {
            System.out.println("Maybe name matches");
        }

        // ============================================================
        // 12. OBJECTS / INHERITANCE / INTERFACES / RECORDS
        // ============================================================

        Animal cat = new Cat("CoffeeBean");
        System.out.println(cat.speak()); // dynamic dispatch

        Point point = new Point(3, 4);
        System.out.println(point.x() + ", " + point.y());

        Greeter greeter = person -> "Hello, " + person + "!";
        System.out.println(greeter.greet("Mocha"));

        Status status = Status.RUNNING;
        System.out.println(status);

        // ============================================================
        // 13. EXCEPTIONS
        // ============================================================

        try {
            int number = Integer.parseInt("123");
            System.out.println(number);
        } catch (NumberFormatException ex) {
            System.err.println("Invalid integer: " + ex.getMessage());
        } finally {
            // Runs whether an exception occurred or not.
        }

        try {
            System.out.println(divide(10, 2));
        } catch (IllegalArgumentException ex) {
            System.err.println(ex.getMessage());
        }

        // Checked exceptions must be caught or declared with throws.

        // ============================================================
        // 14. FILE I/O / TRY-WITH-RESOURCES
        // ============================================================

        Path path = Path.of("example.txt");

        // Files.writeString(path, "Hello\n");
        // String contents = Files.readString(path);
        // List<String> lines = Files.readAllLines(path);

        // try (var reader = Files.newBufferedReader(path)) {
        //     System.out.println(reader.readLine());
        // }

        // ============================================================
        // 15. OPTIONAL
        // ============================================================

        Optional<String> nickname = Optional.ofNullable(maybeName);
        String displayName = nickname.orElse("Guest");
        nickname.ifPresent(System.out::println);
        System.out.println(displayName);

        // Optional is useful for return values that may be absent.
        // Avoid using it as a replacement for every nullable field/parameter.

        // ============================================================
        // 16. STREAMS / LAMBDAS / METHOD REFERENCES
        // ============================================================

        List<Integer> source = List.of(1, 2, 3, 4, 5, 6);

        List<Integer> evens = source.stream()
                .filter(n -> n % 2 == 0)
                .map(n -> n * 10)
                .toList();

        int streamTotal = source.stream()
                .mapToInt(Integer::intValue)
                .sum();

        String csv = names.stream().collect(Collectors.joining(", "));

        System.out.println(evens);
        System.out.println(streamTotal);
        System.out.println(csv);

        // ============================================================
        // 17. PATTERN MATCHING
        // ============================================================

        Object object = "hello";

        if (object instanceof String stringValue) {
            System.out.println(stringValue.toUpperCase());
        }

        // ============================================================
        // 18. COMMON GOTCHAS
        // ============================================================

        // 1. Use .equals() for String/object content comparison, not ==.
        // 2. Integer division truncates: 5 / 2 == 2.
        // 3. Array length is .length; String length is .length(); collections use .size().
        // 4. Java is pass-by-value, including object references.
        // 5. NullPointerException occurs when dereferencing null.
        // 6. Generics do not accept primitives directly: use Integer, Double, etc.
        // 7. HashMap/HashSet do not guarantee sorted order.
        // 8. Checked exceptions must be caught or declared.
        // 9. String is immutable; repeated concatenation in loops may favor StringBuilder.
        // 10. List.of / Set.of / Map.of return unmodifiable collections.

        StringBuilder builder = new StringBuilder();
        builder.append("Hello").append(' ').append("Java");
        System.out.println(builder);
    }

    // ============================================================
    // 19. EXTRA METHOD EXAMPLES
    // ============================================================

    static int total(int... values) {
        int sum = 0;
        for (int value : values) {
            sum += value;
        }
        return sum;
    }

    static String readFile(Path path) throws IOException {
        return Files.readString(path);
    }

    // ============================================================
    // 20. CURRENT JAVA NOTES (2026)
    // ============================================================

    // Java SE 27 is the current Java SE release as of September 2026.
    // Java 25 is an LTS release and is a strong long-term deployment target.
    // This file intentionally keeps executable examples compatible with Java 21+.
    // Newer releases continue evolving pattern matching and related language features.
    // Preview features require explicit compiler/runtime flags and should not be treated
    // as universally available production syntax until they become permanent.
}
