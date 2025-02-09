---
layout: project
title: "Digit Occurrence Graphing"
download: "/Projects/digits/Downloads/digits.zip"
image: "/Projects/digits/Images/digits.png"
---

## Overview

This project is a neat C program that counts the occurrences of every digit (0–9) in a number you provide and then visualizes the results as a graph. Whether you're learning C or just looking for a quick utility to analyze numbers, this program is both educational and fun to use.

{% include figure.html src=page.image alt="Digit Occurrence Graph" caption="Figure 1: Sample graph showing digit frequencies" %}

## How It Works

The program reads an input number, iterates over each digit, and tallies the frequency of each digit from 0 to 9. Once the counting is complete, it outputs the results in a graphical format (either by printing a text-based graph to the console or generating an image, depending on your implementation).

## Compilation and Usage

To compile and run the program on Linux, follow these steps:

1. Open a terminal and navigate to the project's directory.
2. Compile the C source code using GCC:
```bash
gcc -o digits digits.c
```
3. Run the program:
```bash
./digits
```

*Tip:* Ensure that you have GCC installed. On most Linux systems, you can install it via your package manager (e.g., `sudo apt install gcc` on Ubuntu).

## Download

If you'd like to review or modify the code, you can download the complete project as a ZIP archive:

[Download Digit Occurrence Graphing ZIP]({{ page.download }})

## Customization and Contributions

Feel free to experiment with the source code! You might extend the functionality by improving the graph output, adding error handling for invalid inputs, or integrating the program with other tools. Contributions and suggestions are welcome!
