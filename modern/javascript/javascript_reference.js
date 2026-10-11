// Modern JavaScript syntax reference: practical examples for everyday use.
// Verified against current MDN and ECMAScript documentation.

"use strict";

// ============================================================
// 1. OUTPUT, INPUT, COMMENTS
// ============================================================

console.log("Hello, world!");
console.warn("Warning message");
console.error("Error message");

// Browser-only input:
// const userName = prompt("Name:");

// Single-line comment
/* Multi-line comment */


// ============================================================
// 2. VARIABLES AND DATA TYPES
// ============================================================

// Prefer const by default. Use let when reassignment is needed.
const name = "Corbie";       // string
let age = 28;                // number
const price = 4.99;          // number
const isReady = true;        // boolean
const nothing = null;        // intentional absence of value
let notAssigned;             // undefined
const huge = 12345678901234567890n; // bigint
const uniqueId = Symbol("id");      // symbol

age = 29; // valid because age was declared with let

// const prevents reassignment, not object mutation.
const settings = { theme: "dark" };
settings.theme = "light"; // valid

// JavaScript is dynamically typed.
let value = 10;
value = "ten";

console.log(typeof name);        // "string"
console.log(typeof age);         // "number"
console.log(typeof isReady);     // "boolean"
console.log(typeof notAssigned); // "undefined"
console.log(typeof nothing);     // "object" (historical JavaScript quirk)

// Avoid var in modern code unless you specifically need its function-scoped behavior.


// ============================================================
// 3. OPERATORS
// ============================================================

const sum = 2 + 3;
const difference = 5 - 2;
const product = 4 * 3;
const quotient = 10 / 4;
const remainder = 10 % 4;
const power = 2 ** 3;

let counter = 10;
counter += 2;
counter -= 1;
counter++;
counter--;

// Comparison: < <= > >=
// Strict equality: === !==
// Loose equality: == !=   (performs type coercion; usually avoid)

console.log(5 === 5);    // true
console.log("5" === 5);  // false
console.log("5" == 5);   // true because == converts types

// Logical operators
const canEnter = isReady && age >= 18;
const fallbackName = name || "Anonymous";
const isNotReady = !isReady;

// Nullish coalescing: fallback only for null or undefined.
const displayName = null ?? "Guest"; // "Guest"
const zeroValue = 0 ?? 99;            // 0

// Logical assignment operators.
let title = null;
title ??= "Untitled";

let enabled = true;
enabled &&= isReady;

let label = "";
label ||= "Default";

// Ternary operator.
const category = age >= 18 ? "adult" : "minor";


// ============================================================
// 4. CONDITIONALS AND BOOLEAN LOGIC
// ============================================================

let status;

if (age >= 18) {
    status = "adult";
} else if (age >= 13) {
    status = "teen";
} else {
    status = "child";
}

switch (status) {
    case "adult":
        console.log("18+");
        break;
    case "teen":
        console.log("13-17");
        break;
    default:
        console.log("child");
}

// Common falsy values:
// false, 0, -0, 0n, "", null, undefined, NaN

if (name) {
    console.log("Name is truthy");
}


// ============================================================
// 5. LOOPS
// ============================================================

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

// for...of iterates values from iterable objects.
for (const number of [10, 20, 30]) {
    console.log(number);
}

// for...in iterates enumerable property keys.
const pet = { name: "CoffeeBean", color: "black" };
for (const key in pet) {
    console.log(key, pet[key]);
}

for (let i = 0; i < 10; i++) {
    if (i === 2) continue;
    if (i === 5) break;
    console.log(i);
}


// ============================================================
// 6. FUNCTIONS
// ============================================================

function add(a, b) {
    return a + b;
}

const subtract = function (a, b) {
    return a - b;
};

const multiply = (a, b) => a * b;

function greet(person = "Guest") {
    return `Hello, ${person}!`;
}

function totalPrice(...prices) {
    return prices.reduce((total, current) => total + current, 0);
}

console.log(add(2, 3));
console.log(subtract(10, 4));
console.log(multiply(4, 5));
console.log(greet());
console.log(totalPrice(10, 20, 30));

// Arrow functions do NOT have their own this, arguments, super, or new.target.
// That makes them useful for callbacks, but not as drop-in replacements for every function.


// ============================================================
// 7. SCOPE, HOISTING, AND THE TEMPORAL DEAD ZONE
// ============================================================

if (true) {
    const blockScoped = "inside block";
    let alsoBlockScoped = 123;
    console.log(blockScoped, alsoBlockScoped);
}

// console.log(blockScoped); // ReferenceError

// var is function-scoped, not block-scoped.
function scopeExample() {
    if (true) {
        var oldStyle = "visible throughout function";
    }
    console.log(oldStyle);
}

scopeExample();

// let/const bindings exist from the beginning of their scope, but cannot be
// accessed before their declaration executes. That region is the temporal dead zone.


// ============================================================
// 8. ARRAYS
// ============================================================

const numbers = [10, 20, 30];

numbers.push(40);          // add to end
numbers.pop();             // remove from end
numbers.unshift(5);        // add to beginning
numbers.shift();           // remove from beginning

const first = numbers[0];
const last = numbers.at(-1);
const slice = numbers.slice(0, 2); // non-mutating copy of part of array

const doubled = numbers.map((n) => n * 2);
const evens = numbers.filter((n) => n % 2 === 0);
const total = numbers.reduce((acc, n) => acc + n, 0);
const found = numbers.find((n) => n > 15);
const foundIndex = numbers.findIndex((n) => n > 15);
const hasLarge = numbers.some((n) => n > 25);
const allPositive = numbers.every((n) => n > 0);

numbers.forEach((n) => console.log(n));

const sortedCopy = [...numbers].sort((a, b) => a - b);

console.log(first, last, slice, doubled, evens, total, found, foundIndex, hasLarge, allPositive, sortedCopy);


// ============================================================
// 9. OBJECTS
// ============================================================

const person = {
    name: "Corbie",
    age: 28,
    greet() {
        return `Hi, I'm ${this.name}.`;
    },
};

console.log(person.name);
console.log(person["age"]);
person.city = "Charleston";

const keys = Object.keys(person);
const values = Object.values(person);
const entries = Object.entries(person);

console.log(keys, values, entries, person.greet());


// ============================================================
// 10. DESTRUCTURING, SPREAD, AND REST
// ============================================================

const [firstNumber, secondNumber] = numbers;
const { name: personName, age: personAge } = person;

const moreNumbers = [...numbers, 40, 50];
const updatedPerson = { ...person, age: 29 };

function printCoordinates(...coords) {
    console.log(coords);
}

printCoordinates(10, 20, 30);
console.log(firstNumber, secondNumber, personName, personAge, moreNumbers, updatedPerson);


// ============================================================
// 11. STRINGS
// ============================================================

const text = "  Hello JavaScript  ";
const clean = text.trim();
const upper = clean.toUpperCase();
const lower = clean.toLowerCase();
const contains = clean.includes("JavaScript");
const starts = clean.startsWith("Hello");
const ends = clean.endsWith("Script");
const parts = clean.split(" ");
const joined = ["a", "b", "c"].join("-");
const replaced = clean.replace("JavaScript", "JS");
const formatted = `${name} is ${age} years old.`;

console.log(upper, lower, contains, starts, ends, parts, joined, replaced, formatted);


// ============================================================
// 12. OPTIONAL CHAINING AND NULLISH VALUES
// ============================================================

const user = {
    profile: {
        nickname: "Corbie",
    },
};

const nickname = user.profile?.nickname;
const missingCity = user.address?.city;          // undefined instead of error
const safeMethodResult = user.profile?.sayHi?.(); // undefined if method missing
const preferredName = user.profile?.nickname ?? "Guest";

console.log(nickname, missingCity, safeMethodResult, preferredName);


// ============================================================
// 13. CLASSES AND INHERITANCE
// ============================================================

class Animal {
    constructor(name) {
        this.name = name;
    }

    speak() {
        return `${this.name} makes a sound.`;
    }
}

class Cat extends Animal {
    constructor(name, color) {
        super(name);
        this.color = color;
    }

    speak() {
        return `${this.name} says meow.`;
    }
}

const cat = new Cat("CoffeeBean", "black");
console.log(cat.speak());


// ============================================================
// 14. ERROR HANDLING
// ============================================================

try {
    const parsed = JSON.parse('{"ok":true}');
    console.log(parsed.ok);
} catch (error) {
    console.error("Invalid JSON:", error.message);
} finally {
    // Runs whether an exception occurred or not.
}

function divide(a, b) {
    if (b === 0) {
        throw new Error("Cannot divide by zero.");
    }
    return a / b;
}


// ============================================================
// 15. JSON
// ============================================================

const jsonText = JSON.stringify({ name: "CoffeeBean", age: 5 });
const parsedObject = JSON.parse(jsonText);
console.log(jsonText, parsedObject.name);


// ============================================================
// 16. PROMISES AND ASYNC / AWAIT
// ============================================================

function wait(milliseconds) {
    return new Promise((resolve) => {
        setTimeout(resolve, milliseconds);
    });
}

async function asyncExample() {
    await wait(10);
    return "done";
}

asyncExample()
    .then((result) => console.log(result))
    .catch((error) => console.error(error));

async function getJson(url) {
    const response = await fetch(url);

    if (!response.ok) {
        throw new Error(`HTTP ${response.status}`);
    }

    return response.json();
}

// Example browser/module usage:
// try {
//     const data = await getJson("https://example.com/data.json");
//     console.log(data);
// } catch (error) {
//     console.error(error);
// }

// Run independent promises concurrently when they do not depend on each other:
// const [a, b] = await Promise.all([fetch(urlA), fetch(urlB)]);


// ============================================================
// 17. DOM BASICS (BROWSER ONLY)
// ============================================================

// const heading = document.querySelector("h1");
// heading.textContent = "Updated heading";

// const button = document.querySelector("#saveButton");
// button.addEventListener("click", (event) => {
//     console.log("Clicked", event.target);
// });

// const newItem = document.createElement("li");
// newItem.textContent = "New item";
// document.querySelector("ul")?.append(newItem);


// ============================================================
// 18. MODULES
// ============================================================

// math.js
// export function add(a, b) {
//     return a + b;
// }
// export const PI = 3.14159;

// app.js
// import { add, PI } from "./math.js";

// Default export:
// export default function greet() {}
// import greet from "./greet.js";

// Top-level await is allowed in JavaScript modules.


// ============================================================
// 19. NODE.JS FILE I/O (NODE ONLY)
// ============================================================

// import { readFile, writeFile } from "node:fs/promises";
// await writeFile("example.txt", "Hello\n", "utf8");
// const contents = await readFile("example.txt", "utf8");


// ============================================================
// 20. MAP AND SET
// ============================================================

const scoreMap = new Map();
scoreMap.set("Corbie", 100);
console.log(scoreMap.get("Corbie"));
console.log(scoreMap.has("Corbie"));

const tags = new Set(["js", "web", "js"]);
tags.add("frontend");
console.log(tags.has("js"));
console.log([...tags]);


// ============================================================
// 21. COMMON JAVASCRIPT GOTCHAS
// ============================================================

// 1. Prefer === and !== over == and != unless coercion is intentional.
// 2. const means the binding cannot be reassigned; object contents may still mutate.
// 3. null and undefined are different values.
// 4. typeof null === "object" is a historical language quirk.
// 5. NaN is not equal to itself; use Number.isNaN(value).
// 6. Array/object equality compares identity, not deep contents.
// 7. for...of iterates values; for...in iterates property keys.
// 8. Arrow functions do not have their own this.
// 9. let/const are block-scoped and have a temporal dead zone before declaration.
// 10. await works inside async functions and at module top level, not normal script top level.

console.log(Number.isNaN(NaN)); // true
console.log([] === []);         // false: different array objects


// ============================================================
// 22. QUICK REFERENCE: WHICH DECLARATION?
// ============================================================

// const -> default choice; binding will not be reassigned
// let   -> use when the variable must be reassigned
// var   -> older function-scoped declaration; generally avoid in modern code
