"""Python syntax reference: compact examples for everyday use."""

from pathlib import Path


# ---------- OUTPUT / INPUT ----------
print("Hello, world!")
# name = input("Name: ")


# ---------- VARIABLES / DATA TYPES ----------
name = "Corbie"          # str
age = 28                 # int
price = 4.99             # float
is_ready = True          # bool
nothing = None           # NoneType


# ---------- OPERATORS ----------
add = 2 + 3
subtract = 5 - 2
multiply = 4 * 3
divide = 10 / 4          # float division
floor_divide = 10 // 4   # integer-style floor division
remainder = 10 % 4
power = 2 ** 3

# Comparisons: == != < <= > >=
# Logic: and, or, not


# ---------- CONDITIONALS ----------
if age >= 18:
    status = "adult"
elif age >= 13:
    status = "teen"
else:
    status = "child"


# ---------- LOOPS ----------
for i in range(5):
    print(i)

count = 0
while count < 3:
    count += 1

for number in [1, 2, 3, 4, 5]:
    if number == 2:
        continue
    if number == 5:
        break


# ---------- FUNCTIONS ----------
def greet(person: str, greeting: str = "Hello") -> str:
    return f"{greeting}, {person}!"


message = greet(name)


# ---------- COLLECTIONS ----------
numbers = [10, 20, 30]                  # list: ordered, mutable
coordinates = (10, 20)                  # tuple: ordered, immutable
unique_tags = {"python", "reference"}   # set: unique values
person = {"name": "Corbie", "age": 28} # dict: key/value pairs

numbers.append(40)
first = numbers[0]
last = numbers[-1]
subset = numbers[1:3]

for key, value in person.items():
    print(key, value)

squares = [n * n for n in range(5)]


# ---------- STRINGS ----------
text = "  Hello Python  "
clean = text.strip()
upper = clean.upper()
contains = "Python" in clean
parts = clean.split(" ")
joined = "-".join(["a", "b", "c"])
formatted = f"{name} is {age} years old."


# ---------- CLASSES / OBJECTS ----------
class Cat:
    def __init__(self, name: str):
        self.name = name

    def speak(self) -> str:
        return f"{self.name} says meow."


cat = Cat("CoffeeBean")
print(cat.speak())


# ---------- ERROR HANDLING ----------
try:
    value = int("123")
except ValueError as exc:
    print(f"Invalid integer: {exc}")
else:
    print(value)
finally:
    pass


# ---------- FILE I/O ----------
path = Path("example.txt")
# path.write_text("Hello\n", encoding="utf-8")
# contents = path.read_text(encoding="utf-8")

# Traditional context-manager form:
# with open("example.txt", "r", encoding="utf-8") as file:
#     contents = file.read()


# ---------- USEFUL BUILT-INS ----------
length = len(numbers)
smallest = min(numbers)
largest = max(numbers)
total = sum(numbers)
sorted_numbers = sorted(numbers, reverse=True)

# enumerate gives index + value; zip pairs iterables.
for index, value in enumerate(numbers):
    print(index, value)

for letter, number in zip(["a", "b"], [1, 2]):
    print(letter, number)


if __name__ == "__main__":
    print(message)
