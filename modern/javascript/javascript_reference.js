// JavaScript syntax reference: compact examples for everyday use.

"use strict";

// ---------- OUTPUT / INPUT ----------
console.log("Hello, world!");
// Browser input: const name = prompt("Name:");


// ---------- VARIABLES / DATA TYPES ----------
const name = "Corbie";       // string; cannot be reassigned
let age = 28;                // number; can be reassigned
const price = 4.99;          // number
const isReady = true;        // boolean
const nothing = null;
let notAssigned;             // undefined


// ---------- OPERATORS ----------
const sum = 2 + 3;
const difference = 5 - 2;
const product = 4 * 3;
const quotient = 10 / 4;
const remainder = 10 % 4;
const power = 2 ** 3;

// Prefer strict equality: === and !==
// Comparisons: < <= > >=
// Logic: && || !
// Nullish fallback: value ?? fallback


// ---------- CONDITIONALS ----------
let status;
if (age >= 18) {
    status = "adult";
} else if (age >= 13) {
    status = "teen";
} else {
    status = "child";
}

const category = age >= 18 ? "adult" : "minor";
console.log(status, category);


// ---------- LOOPS ----------
for (let i = 0; i < 5; i++) {
    console.log(i);
}

let count = 0;
while (count < 3) {
    count++;
}

do {
    count--;
} while (count > 0);

for (const value of [10, 20, 30]) {
    console.log(value);
}


// ---------- FUNCTIONS ----------
function add(a, b) {
    return a + b;
}

const multiply = (a, b) => a * b;
console.log(add(2, 3), multiply(4, 5));


// ---------- ARRAYS / OBJECTS ----------
const numbers = [10, 20, 30];
numbers.push(40);

const person = {
    name: "Corbie",
    age: 28,
};

console.log(numbers[0]);
console.log(person.name);
console.log(person["age"]);

const doubled = numbers.map((n) => n * 2);
const evens = numbers.filter((n) => n % 2 === 0);
const total = numbers.reduce((acc, n) => acc + n, 0);
console.log(doubled, evens, total);


// ---------- STRINGS ----------
const text = "  Hello JavaScript  ";
const clean = text.trim();
const upper = clean.toUpperCase();
const contains = clean.includes("JavaScript");
const parts = clean.split(" ");
const joined = ["a", "b", "c"].join("-");
const formatted = `${name} is ${age} years old.`;
console.log(upper, contains, parts, joined, formatted, price, isReady, nothing, notAssigned);


// ---------- CLASSES / OBJECTS ----------
class Cat {
    constructor(catName) {
        this.name = catName;
    }

    speak() {
        return `${this.name} says meow.`;
    }
}

const cat = new Cat("CoffeeBean");
console.log(cat.speak());


// ---------- ERROR HANDLING ----------
try {
    const parsed = JSON.parse('{"ok":true}');
    console.log(parsed.ok);
} catch (error) {
    console.error("Invalid JSON:", error.message);
} finally {
    // Runs whether an exception occurred or not.
}


// ---------- ASYNC / PROMISES ----------
async function getJson(url) {
    const response = await fetch(url);

    if (!response.ok) {
        throw new Error(`HTTP ${response.status}`);
    }

    return response.json();
}

// getJson("https://example.com/data.json")
//     .then(console.log)
//     .catch(console.error);


// ---------- MODULES ----------
// Export from one file:
// export { add };
// Import in another ES module:
// import { add } from "./math.js";

// Node.js file I/O (ES modules):
// import { readFile, writeFile } from "node:fs/promises";
// await writeFile("example.txt", "Hello\n", "utf8");
// const contents = await readFile("example.txt", "utf8");
