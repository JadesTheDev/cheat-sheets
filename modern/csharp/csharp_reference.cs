// Modern C# reference: practical examples for everyday use.
// Core examples intentionally use broadly supported modern syntax.
// C# 14 is the current language release in .NET 10 as of 2026; see notes at the end.

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

public interface ISpeaker
{
    string Speak();
}

public abstract class Animal
{
    public string Name { get; }

    protected Animal(string name)
    {
        Name = name;
    }

    public abstract string Speak();
}

public class Cat : Animal, ISpeaker
{
    public string Color { get; set; }

    public Cat(string name, string color) : base(name)
    {
        Color = color;
    }

    public override string Speak() => $"{Name} says meow.";
}

public record Point(int X, int Y);

public enum Status
{
    Idle,
    Running,
    Done
}

public class Program
{
    // ============================================================
    // 1. METHODS
    // ============================================================

    static int Add(int a, int b) => a + b;

    static decimal Total(params decimal[] values)
    {
        decimal total = 0m;
        foreach (decimal value in values)
        {
            total += value;
        }
        return total;
    }

    // ============================================================
    // 2. PROGRAM ENTRY POINT
    // ============================================================

    public static async Task Main()
    {
        // ============================================================
        // 3. OUTPUT / INPUT / COMMENTS
        // ============================================================

        Console.WriteLine("Hello, world!");
        Console.Write("Same line");
        Console.WriteLine();

        // Console.Write("Name: ");
        // string? input = Console.ReadLine();

        // Single-line comment
        /* Multi-line comment */

        // ============================================================
        // 4. VARIABLES / TYPES / NULLABILITY
        // ============================================================

        byte small = 100;
        short medium = 30_000;
        int age = 28;
        long population = 8_000_000_000L;
        float ratio = 1.5f;
        double price = 4.99;
        decimal money = 4.99m;
        char grade = 'A';
        bool isReady = true;
        string name = "Corbie";
        string? maybeName = null;

        var inferredNumber = 42; // still statically typed as int
        const double TaxRate = 0.07;

        Console.WriteLine($"{small} {medium} {age} {population} {ratio} {price} {money} {grade} {isReady}");
        Console.WriteLine($"{inferredNumber} {TaxRate} {maybeName}");

        // Nullable value type:
        int? optionalScore = null;

        // ============================================================
        // 5. OPERATORS / CONVERSIONS
        // ============================================================

        int sum = 2 + 3;
        int difference = 5 - 2;
        int product = 4 * 3;
        double quotient = 10.0 / 4.0;
        int integerDivision = 10 / 4; // 2
        int remainder = 10 % 4;

        int counter = 10;
        counter += 2;
        counter++;
        counter--;

        // Comparison: == != < <= > >=
        // Logic: && || !
        // Bitwise: & | ^ ~ << >>

        int parsed = int.Parse("123");
        bool parsedSafely = int.TryParse("456", out int safeNumber);
        string numberText = parsed.ToString();
        double widened = age;
        int narrowed = (int)4.9;

        Console.WriteLine($"{sum} {difference} {product} {quotient} {integerDivision} {remainder}");
        Console.WriteLine($"{parsedSafely} {safeNumber} {numberText} {widened} {narrowed}");

        // ============================================================
        // 6. NULL OPERATORS
        // ============================================================

        string displayName = maybeName ?? "Guest";
        int? nameLength = maybeName?.Length;
        maybeName ??= "Fallback";

        Console.WriteLine($"{displayName} {nameLength} {maybeName}");

        // Null-forgiving operator: tells compiler you believe a value is non-null.
        // string definitelyName = possiblyNull!;
        // Use carefully: it suppresses warnings, not runtime NullReferenceException.

        // ============================================================
        // 7. CONDITIONALS / SWITCH / PATTERN MATCHING
        // ============================================================

        string category;

        if (age >= 18)
        {
            category = "adult";
        }
        else if (age >= 13)
        {
            category = "teen";
        }
        else
        {
            category = "child";
        }

        string shortCategory = age >= 18 ? "adult" : "minor";

        string ageGroup = age switch
        {
            < 13 => "child",
            < 18 => "teen",
            _ => "adult"
        };

        object obj = "hello";
        if (obj is string textValue)
        {
            Console.WriteLine(textValue.ToUpperInvariant());
        }

        Console.WriteLine($"{category} {shortCategory} {ageGroup}");

        // ============================================================
        // 8. LOOPS
        // ============================================================

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

        for (int i = 0; i < 10; i++)
        {
            if (i == 2) continue;
            if (i == 5) break;
            Console.WriteLine(i);
        }

        // ============================================================
        // 9. ARRAYS / LISTS / DICTIONARIES / SETS
        // ============================================================

        int[] numbers = { 10, 20, 30 };
        List<string> names = new() { "CoffeeBean", "Mocha" };
        Dictionary<string, int> scores = new()
        {
            ["A"] = 100,
            ["B"] = 90
        };
        HashSet<string> tags = new() { "csharp", "dotnet" };

        names.Add("Crow");
        names.Remove("Crow");
        scores["C"] = 80;
        tags.Add("reference");

        Console.WriteLine(numbers[0]);
        Console.WriteLine(names[0]);
        Console.WriteLine(scores.GetValueOrDefault("Z", 0));
        Console.WriteLine(tags.Contains("dotnet"));

        foreach (KeyValuePair<string, int> pair in scores)
        {
            Console.WriteLine($"{pair.Key} -> {pair.Value}");
        }

        // ============================================================
        // 10. STRINGS
        // ============================================================

        string text = "  Hello C#  ";
        string clean = text.Trim();
        string upper = clean.ToUpperInvariant();
        bool contains = clean.Contains("C#", StringComparison.Ordinal);
        string[] parts = clean.Split(' ', StringSplitOptions.RemoveEmptyEntries);
        string joined = string.Join("-", new[] { "a", "b", "c" });
        string formatted = $"{name} is {age} years old.";

        Console.WriteLine($"{upper} {contains} {parts.Length} {joined} {formatted}");

        // Verbatim string:
        string windowsPath = @"C:\Users\Corbie\Documents";

        // Raw string literal (C# 11+):
        string json = """
        { "name": "CoffeeBean", "kind": "cat" }
        """;

        Console.WriteLine(windowsPath);
        Console.WriteLine(json);

        // ============================================================
        // 11. METHODS / OPTIONAL / NAMED / PARAMS
        // ============================================================

        Console.WriteLine(Add(2, 3));
        Console.WriteLine(DescribePerson(name: "Mocha", age: 5));
        Console.WriteLine(Total(10m, 20m, 30m));

        // ============================================================
        // 12. CLASSES / RECORDS / INTERFACES / INHERITANCE
        // ============================================================

        Animal cat = new Cat("CoffeeBean", "black");
        Console.WriteLine(cat.Speak());

        Point point = new(3, 4);
        Point moved = point with { X = 10 };
        Console.WriteLine($"{point} -> {moved}");

        Status status = Status.Running;
        Console.WriteLine(status);

        // ============================================================
        // 13. TUPLES / DECONSTRUCTION
        // ============================================================

        (string PetName, int PetAge) pet = ("Mocha", 5);
        Console.WriteLine($"{pet.PetName} {pet.PetAge}");

        var (petName, petAge) = pet;
        Console.WriteLine($"{petName} {petAge}");

        // ============================================================
        // 14. EXCEPTIONS
        // ============================================================

        try
        {
            int value = int.Parse("123");
            Console.WriteLine(value);
        }
        catch (FormatException ex)
        {
            Console.Error.WriteLine($"Invalid integer: {ex.Message}");
        }
        finally
        {
            // Runs whether an exception occurred or not.
        }

        // Prefer TryParse for expected invalid user input.
        if (int.TryParse("789", out int parsedValue))
        {
            Console.WriteLine(parsedValue);
        }

        // ============================================================
        // 15. FILE I/O / USING
        // ============================================================

        string path = "example.txt";

        // File.WriteAllText(path, "Hello\n");
        // string contents = File.ReadAllText(path);
        // string[] lines = File.ReadAllLines(path);

        // using StreamReader reader = File.OpenText(path);
        // string? firstLine = reader.ReadLine();

        // ============================================================
        // 16. LINQ
        // ============================================================

        int[] source = { 1, 2, 3, 4, 5, 6 };

        int[] evenSquares = source
            .Where(n => n % 2 == 0)
            .Select(n => n * n)
            .ToArray();

        int total = source.Sum();
        bool anyLarge = source.Any(n => n > 5);
        int firstLarge = source.FirstOrDefault(n => n > 3);

        Console.WriteLine(string.Join(", ", evenSquares));
        Console.WriteLine($"{total} {anyLarge} {firstLarge}");

        // ============================================================
        // 17. DELEGATES / LAMBDAS / EVENTS
        // ============================================================

        Func<int, int, int> multiply = (a, b) => a * b;
        Action<string> print = message => Console.WriteLine(message);
        Predicate<int> isEven = number => number % 2 == 0;

        print($"{multiply(4, 5)} {isEven(4)}");

        // ============================================================
        // 18. ASYNC / AWAIT
        // ============================================================

        await Task.Delay(10);
        string asyncResult = await GetMessageAsync();
        Console.WriteLine(asyncResult);

        // For independent tasks:
        Task<int> taskA = Task.FromResult(1);
        Task<int> taskB = Task.FromResult(2);
        int[] results = await Task.WhenAll(taskA, taskB);
        Console.WriteLine(string.Join(", ", results));

        // ============================================================
        // 19. COMMON GOTCHAS
        // ============================================================

        // 1. int / int performs integer division: 5 / 2 == 2.
        // 2. decimal is usually preferred for money; use the m suffix.
        // 3. string is immutable.
        // 4. nullable reference annotations are compile-time analysis, not runtime guards.
        // 5. const is compile-time constant; readonly is runtime-initialized then fixed.
        // 6. List<T> is mutable; IEnumerable<T> is an iteration abstraction, not necessarily a list.
        // 7. LINQ queries are often deferred until enumerated.
        // 8. async void should generally be reserved for event handlers; prefer Task.
        // 9. Dispose resources via using / await using when they implement IDisposable/IAsyncDisposable.
        // 10. Equality behavior differs for reference types, records, structs, and custom implementations.

        _ = optionalScore;
    }

    // ============================================================
    // 20. EXTRA METHOD EXAMPLES
    // ============================================================

    static string DescribePerson(string name, int age = 0)
    {
        return $"{name} is {age}.";
    }

    static async Task<string> GetMessageAsync()
    {
        await Task.Delay(10);
        return "Async work finished.";
    }

    // ============================================================
    // 21. CURRENT C# NOTES (2026)
    // ============================================================

    // C# 14 is the latest C# release and is supported on .NET 10.
    // Major C# 14 additions include:
    // - extension members (including extension properties/static extensions)
    // - null-conditional assignment
    // - field-backed properties via the field keyword
    // - modifiers on simple lambda parameters
    // - more partial member forms
    // - user-defined compound assignment operators
    // - nameof support for unbound generic types
    //
    // Keep target framework + language version in mind: the compiler controls which
    // language features are available, while APIs depend on the chosen .NET target.
}
