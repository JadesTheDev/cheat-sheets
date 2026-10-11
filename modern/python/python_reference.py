"""Modern Python 3 syntax reference.

Topic coverage follows Tony Gaddis, Starting Out with Python (2009),
but the examples are updated from Python 2-era syntax to Python 3.
"""

import math
import random


# ============================================================
# 1. OUTPUT, INPUT, COMMENTS
# ============================================================

print("Hello, world!")

# input() returns a string in Python 3.
# name = input("Name: ")
# age = int(input("Age: "))
# price = float(input("Price: "))

# Single-line comment.
"""Triple-quoted strings can span multiple lines and are used as docstrings."""


# ============================================================
# 2. VARIABLES AND DATA TYPES
# ============================================================

name = "Corbie"       # str
age = 28              # int
price = 4.99          # float
is_ready = True       # bool
nothing = None        # NoneType

score = 10
score = 25            # reassignment

whole = int(7.9)      # 7
decimal = float(7)    # 7.0
text_number = str(42) # "42"

hourly_pay_rate = 15.50  # snake_case is standard style


# ============================================================
# 3. OPERATORS AND CALCULATIONS
# ============================================================

addition = 5 + 2
subtraction = 5 - 2
multiplication = 5 * 2
division = 5 / 2          # 2.5
floor_division = 5 // 2   # 2
remainder = 5 % 2         # 1
power = 5 ** 2            # 25

count = 10
count += 1                # also -=, *=, /=, //=, %=

# Comparisons: ==  !=  <  <=  >  >=
# Logic: and  or  not

average = (10 + 20 + 30) / 3

square_root = math.sqrt(25)
circle_area = math.pi * 3**2
die_roll = random.randint(1, 6)  # endpoints included


# ============================================================
# 4. CONDITIONALS AND BOOLEAN LOGIC
# ============================================================

temperature = 75

if temperature > 80:
    weather = "hot"
elif temperature >= 60:
    weather = "comfortable"
else:
    weather = "cold"

has_ticket = True

if has_ticket and age >= 18:
    entry = "allowed"

answer = "yes"

if answer == "yes":
    confirmed = True

is_weekend = False

if not is_weekend:
    workday = True


# ============================================================
# 5. LOOPS
# ============================================================

count = 1
while count <= 3:
    print(count)
    count += 1

for number in range(5):       # 0-4
    print(number)

for number in range(1, 6):    # 1-5
    print(number)

for number in range(0, 10, 2):
    print(number)

# Running total / accumulator.
total = 0
for number in [10, 20, 30]:
    total += number

# Nested loops.
for row in range(2):
    for column in range(3):
        print(row, column)

# break exits; continue skips to the next iteration.
for number in range(10):
    if number == 2:
        continue
    if number == 5:
        break

# Sentinel loop pattern:
# value = input("Enter a value or 'quit': ")
# while value != "quit":
#     print(value)
#     value = input("Enter a value or 'quit': ")

# Validation loop:
# number = int(input("Enter a positive number: "))
# while number <= 0:
#     number = int(input("Try again: "))


# ============================================================
# 6. FUNCTIONS
# ============================================================

def show_message():
    print("Hello from a function.")


def greet(person):
    print(f"Hello, {person}!")


def add(a, b):
    return a + b


def calculate_pay(hours, rate=15.00):
    return hours * rate


show_message()
greet("CoffeeBean")
result = add(4, 6)
pay = calculate_pay(8)
other_pay = calculate_pay(hours=8, rate=20.00)

# Variables created inside a function are local.
# Variables created outside functions are global.
TAX_RATE = 0.07  # constants are conventionally ALL_CAPS


# ============================================================
# 7. MODULES
# ============================================================

# import math
# result = math.sqrt(16)

# from math import sqrt
# result = sqrt(16)

# Your own .py file can also be imported:
# import geometry
# area = geometry.circle_area(5)


# ============================================================
# 8. STRINGS
# ============================================================

text = "Python"
first_character = text[0]
last_character = text[-1]
slice_text = text[1:4]
length = len(text)

upper = text.upper()
lower = text.lower()
clean = "  hello python  ".strip()

words = "cat,dog,crow".split(",")
joined = "-".join(words)
contains_python = "Python" in text

full_name = "Coffee" + "Bean"
formatted = f"{name} is {age} years old."
money = f"${416.666666:.2f}"

# Escapes: \n newline, \t tab, \" quote, \\ backslash


# ============================================================
# 9. LISTS AND COMMON COLLECTIONS
# ============================================================

numbers = [10, 20, 30]
first = numbers[0]
last = numbers[-1]
subset = numbers[0:2]

numbers.append(40)
numbers.insert(1, 15)
numbers.remove(30)
popped = numbers.pop()
numbers.sort()
numbers.reverse()
numbers_copy = numbers.copy()

for number in numbers:
    print(number)

coordinates = (10, 20)                 # tuple: immutable
unique_tags = {"python", "reference"}  # set: unique values

person = {"name": "Corbie", "age": 28} # dict: key/value pairs
person["city"] = "Charleston"

for key, value in person.items():
    print(key, value)


# ============================================================
# 10. FILE INPUT / OUTPUT
# ============================================================

# "with" automatically closes the file.

# Write:
# with open("example.txt", "w", encoding="utf-8") as file:
#     file.write("Hello\n")

# Read all:
# with open("example.txt", "r", encoding="utf-8") as file:
#     contents = file.read()

# Read line by line:
# with open("example.txt", "r", encoding="utf-8") as file:
#     for line in file:
#         print(line.strip())

# Append:
# with open("example.txt", "a", encoding="utf-8") as file:
#     file.write("Another line\n")


# ============================================================
# 11. EXCEPTIONS
# ============================================================

try:
    value = int("123")
except ValueError:
    print("Invalid integer.")
else:
    print("Conversion worked:", value)
finally:
    pass

# try:
#     with open("numbers.txt", "r", encoding="utf-8") as file:
#         number = float(file.readline())
# except FileNotFoundError:
#     print("File not found.")
# except ValueError:
#     print("File did not contain a valid number.")


# ============================================================
# 12. CLASSES AND OBJECTS
# ============================================================

class Cat:
    def __init__(self, name, color):
        self.name = name
        self.color = color

    def speak(self):
        return f"{self.name} says meow."

    def get_name(self):
        return self.name

    def set_name(self, new_name):
        self.name = new_name


cat = Cat("CoffeeBean", "black")
print(cat.speak())


# ============================================================
# 13. INHERITANCE AND POLYMORPHISM
# ============================================================

class Animal:
    def speak(self):
        return "Some animal sound"


class Dog(Animal):
    def speak(self):
        return "Woof"


class Crow(Animal):
    def speak(self):
        return "Caw"


for animal in [Dog(), Crow()]:
    print(animal.speak())


# ============================================================
# 14. RECURSION
# ============================================================

def factorial(number):
    if number <= 1:          # base case
        return 1
    return number * factorial(number - 1)


five_factorial = factorial(5)


# ============================================================
# 15. USEFUL BUILT-INS
# ============================================================

values = [4, 1, 8, 2]

length = len(values)
smallest = min(values)
largest = max(values)
total = sum(values)
sorted_values = sorted(values)

for index, value in enumerate(values):
    print(index, value)

for letter, number in zip(["a", "b"], [1, 2]):
    print(letter, number)


# ============================================================
# 16. STANDARD ENTRY-POINT PATTERN
# ============================================================

def main():
    print("Python reference loaded.")


if __name__ == "__main__":
    main()


# ============================================================
# PYTHON 2 -> PYTHON 3 NOTES FOR THE 2009 TEXTBOOK
# ============================================================

# Book:   print "Hello"
# Modern: print("Hello")

# Book:   name = raw_input("Name: ")
# Modern: name = input("Name: ")

# Book:   age = input("Age: ")
# Modern: age = int(input("Age: "))

# Book:   3 / 2 == 1
# Modern: 3 / 2 == 1.5
#         3 // 2 == 1

# Book examples often catch IOError for file failures.
# Modern code can use specific exceptions such as FileNotFoundError.

# Python 3 uses lowercase tkinter:
# import tkinter
