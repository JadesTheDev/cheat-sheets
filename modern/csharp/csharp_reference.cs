// C# syntax reference: compact examples for everyday use.

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

public class Cat
{
    public string Name { get; set; }

    public Cat(string name)
    {
        Name = name;
    }

    public string Speak() => $"{Name} says meow.";
}

public class Program
{
    static int Add(int a, int b)
    {
        return a + b;
    }

    public static void Main()
    {
        // ---------- OUTPUT / INPUT ----------
        Console.WriteLine("Hello, world!");
        // Console.Write("Name: ");
        // string? input = Console.ReadLine();

        // ---------- VARIABLES / DATA TYPES ----------
        string name = "Corbie";
        int age = 28;
        double price = 4.99;
        decimal money = 4.99m;
        char grade = 'A';
        bool isReady = true;
        string? maybeName = null;

        var inferredNumber = 42; // compile-time type is int

        // ---------- OPERATORS ----------
        int sum = 2 + 3;
        int difference = 5 - 2;
        int product = 4 * 3;
        double quotient = 10.0 / 4.0;
        int remainder = 10 % 4;

        _ = (sum, difference, product, quotient, remainder, inferredNumber, maybeName);

        // Comparisons: == != < <= > >=
        // Logic: && || !
        // Null helpers: ?? and ?.

        // ---------- CONDITIONALS ----------
        if (age >= 18)
        {
            Console.WriteLine("Adult");
        }
        else if (age >= 13)
        {
            Console.WriteLine("Teen");
        }
        else
        {
            Console.WriteLine("Child");
        }

        string status = age >= 18 ? "adult" : "minor";
        Console.WriteLine(status);

        // ---------- LOOPS ----------
        for (int i = 0; i < 5; i++)
        {
            Console.WriteLine(i);
        }

        int count = 0;
        while (count < 3)
        {
            count++;
        }

        do
        {
            count--;
        } while (count > 0);

        foreach (int number in new[] { 1, 2, 3 })
        {
            Console.WriteLine(number);
        }

        // ---------- METHODS ----------
        Console.WriteLine(Add(2, 3));

        // ---------- COLLECTIONS ----------
        int[] numbers = { 10, 20, 30 };
        List<string> names = new() { "CoffeeBean", "Mocha" };
        Dictionary<string, int> scores = new()
        {
            ["A"] = 100,
            ["B"] = 90
        };

        names.Add("New Cat");
        Console.WriteLine(numbers[0]);
        Console.WriteLine(scores["A"]);

        // ---------- STRINGS ----------
        string text = "  Hello C#  ";
        string clean = text.Trim();
        string formatted = $"{name} is {age} years old.";
        bool contains = clean.Contains("C#");
        string[] parts = clean.Split(' ');
        string joined = string.Join("-", new[] { "a", "b", "c" });
        _ = (formatted, contains, parts, joined, price, money, grade, isReady);

        // ---------- CLASSES / OBJECTS ----------
        Cat cat = new("CoffeeBean");
        Console.WriteLine(cat.Speak());

        // ---------- EXCEPTIONS ----------
        try
        {
            int value = int.Parse("123");
            Console.WriteLine(value);
        }
        catch (FormatException ex)
        {
            Console.WriteLine($"Invalid integer: {ex.Message}");
        }
        finally
        {
            // Runs whether an exception occurred or not.
        }

        // Safer conversion without an exception:
        if (int.TryParse("456", out int parsed))
        {
            Console.WriteLine(parsed);
        }

        // ---------- FILE I/O ----------
        // File.WriteAllText("example.txt", "Hello\n");
        // string contents = File.ReadAllText("example.txt");

        // ---------- LINQ ----------
        int[] evenNumbers = numbers.Where(n => n % 2 == 0).ToArray();
        Console.WriteLine(string.Join(", ", evenNumbers));
    }
}
