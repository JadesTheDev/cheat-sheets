// Java syntax reference: compact examples for everyday use.

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JavaReference {
    static class Cat {
        private String name;

        Cat(String name) {
            this.name = name;
        }

        String speak() {
            return name + " says meow.";
        }
    }

    static int add(int a, int b) {
        return a + b;
    }

    public static void main(String[] args) {
        // ---------- OUTPUT / INPUT ----------
        System.out.println("Hello, world!");
        // Scanner scanner = new Scanner(System.in);
        // String input = scanner.nextLine();

        // ---------- VARIABLES / DATA TYPES ----------
        String name = "Corbie";
        int age = 28;
        double price = 4.99;
        char grade = 'A';
        boolean isReady = true;
        String maybeName = null;

        // ---------- OPERATORS ----------
        int sum = 2 + 3;
        int difference = 5 - 2;
        int product = 4 * 3;
        double quotient = 10.0 / 4.0;
        int remainder = 10 % 4;

        // Comparisons: == != < <= > >=
        // Logic: && || !
        System.out.println(sum + difference + product + quotient + remainder);

        // ---------- CONDITIONALS ----------
        if (age >= 18) {
            System.out.println("Adult");
        } else if (age >= 13) {
            System.out.println("Teen");
        } else {
            System.out.println("Child");
        }

        String status = age >= 18 ? "adult" : "minor";
        System.out.println(status);

        // ---------- LOOPS ----------
        for (int i = 0; i < 5; i++) {
            System.out.println(i);
        }

        int count = 0;
        while (count < 3) {
            count++;
        }

        do {
            count--;
        } while (count > 0);

        int[] values = {1, 2, 3};
        for (int value : values) {
            System.out.println(value);
        }

        // ---------- METHODS ----------
        System.out.println(add(2, 3));

        // ---------- ARRAYS / COLLECTIONS ----------
        int[] numbers = {10, 20, 30};

        List<String> names = new ArrayList<>();
        names.add("CoffeeBean");
        names.add("Mocha");

        Map<String, Integer> scores = new HashMap<>();
        scores.put("A", 100);
        scores.put("B", 90);

        System.out.println(numbers[0]);
        System.out.println(names.get(0));
        System.out.println(scores.get("A"));

        // ---------- STRINGS ----------
        String text = "  Hello Java  ";
        String clean = text.trim();
        String formatted = String.format("%s is %d years old.", name, age);
        boolean contains = clean.contains("Java");
        String[] parts = clean.split("\\s+");
        String joined = String.join("-", "a", "b", "c");

        System.out.println(formatted + contains + parts.length + joined + price + grade + isReady + maybeName);

        // IMPORTANT: use .equals() for String content comparison.
        if (name.equals("Corbie")) {
            System.out.println("Names match");
        }

        // ---------- CLASSES / OBJECTS ----------
        Cat cat = new Cat("CoffeeBean");
        System.out.println(cat.speak());

        // ---------- EXCEPTIONS ----------
        try {
            int parsed = Integer.parseInt("123");
            System.out.println(parsed);
        } catch (NumberFormatException ex) {
            System.out.println("Invalid integer: " + ex.getMessage());
        } finally {
            // Runs whether an exception occurred or not.
        }

        // ---------- FILE I/O ----------
        Path path = Path.of("example.txt");
        try {
            // Files.writeString(path, "Hello\n");
            // String contents = Files.readString(path);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        // Example method declaration that may throw IOException:
        // Files.readString(path);  // handle or declare checked exceptions
    }

    static String readFile(Path path) throws IOException {
        return Files.readString(path);
    }
}
