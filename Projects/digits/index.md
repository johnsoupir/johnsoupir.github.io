---
layout: project
title: "Digit Occurrence Graphing"
download: "/Projects/digits/Downloads/digits.zip"
image: "/Projects/digits/Images/digits.png"
---

## Overview

A cool little C program to count the occerances of every digit from zero to your chosen number. 
This program is optimized for speed and can quickly process large numbers, even into the millions.

While walking through the engineering building one day, I stumbled upon some friends working on a combinatorics problem. Their goal was to determine how many times each digit appears while counting to one million. Being the helpful fellow I am, I pulled out my laptop and started brute-forcing the problem with a C program. While the resulting program was, unfortunately, not an acceptable solution, it did produce the correct count—along with a cool fractal.

{% include figure.html src=page.image alt="Digit Occurrence Graph" caption="Figure 1: Sample graph showing digit frequencies" %}

## Play with it!

First, obtain the files. They are found on my [Github](https://github.com/johnsoupir/digits) and here as a [zip]({{ page.download }}).
To compile and run the program on Linux, follow these steps:

1. Navigate to the project directory in your terminal.
2. Compile the C source code using GCC:
```bash
gcc -o digits digits.c
```
3. Run the program:
```bash
./digits <end-number>
```

Output is saved in a file, and is of the form: 

```<current number> <zeros in current> <zeros running total> <ones in current> <ones running total> ... <nines in current> <nines running total>``` 

Plotting the count of each digit as the number gets larger produces the plot seen above. As the number continues to grow the pattern repeats (for each 10x).

### Cool video
  A video of the results in an animated GNUPlot: [YouTube](https://youtu.be/xAPqNJ5Vm3Q)