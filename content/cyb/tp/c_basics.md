---
title: "Basic"
author: "Clément"
description: "Subjects about C language"
---

# Introduction

This category shows training exercises about C language. For all questions,
please ask on the BackToBasics' [Discord server](https://discord.gg/SJGWzkU2gd).

We cannot use the intranet, so there are somes given files. Please play the
game and do not read the test file. You can download it
[here](https://github.com/BackToBasicsEpita/CyberRef).

A Makefile is already given with these rules:

- `basics`: compiles ;
- `debug`: compiles with debug flags ;
- `check`: runs the testsuite ;
- `clean`: removes all trash files.


You are only allowed to uses the functions defined in the following headers:
- stdio.h

All of the code must be done inside a `basics.c` file.

Your code must compile with the following flags:
`-std=c99 -pedantic -Wall -Wextra -Werror -Wvla`.

Your code must not segfault and have any memory leak.

# FizzBuzz

## Goal

You have to implement the following function:

```c
void fizzbuzz(int n);
```

This function displays on stdout the numbers from 1 to `n` with newlines.
However, it must follow the rules:

- for multiples of 3, it should print *"Fizz"* with a newline ;
- for multiples of 5, it should print *"Buzz"* with a newline ;
- for multiples of 3 and of 5, it should print *"FizzBuzz"* with a newline.

## Example

The output of `fizzbuzz(5)` is:

```bash
1
2
Fizz
4
Buzz
```

# My strlen

You have to implement the following function:

```c
size_t my_strlen(char *s);
```

This functions returns the length of the string argument. The string can be
null, and its size will be 0.

# Binary number

You have to implement the following function:

```c
long binary_number(char str[]);
```

This function returns the integer in decimal corresponding to the binary number
given in argument. If a caracter does not correspond to a binary digit, return
-1.

## Example

The output of `binary_number("110")` is `6`.

The output of `binary_number("This is not correct")` is `-1`.

# Hamming Distance DNA

You have to implement the following function:

```c
int hamming_distance(char *dna1, char *dna2);
```

This function returns the number of differents characters between the two
strings given in arguments.

We read DNA using the letters C,A,G and T. If there is another caracter than
the previous one, return -1. Moreover, if the size of the two parameters are
not equal, return -1.

## Example

The output of `hamming_distance("CAGT", "GAGT")` is `1`.

# Isogram

You have to implement the follwing function:

```c
int is_isogram(char *s);
```

This function returns if the given string is an isogram. An isogram word or
sentence is a word or a phrase without a repetiting letter, however spaces and
non letter caracters are allowed to appear multiple times.

## Example

`House` is an isogram word, but `Test.` is not.

# Move Robot

You have to implement the following function:

```c
struct pair move_robot(struct pair current, char *directions);
```

Moreover, you have to implement the `pair` structure with two integer: `x` and
`y`.

This function moves a robot in the current coordinates on a grid from a string
of directions and returns the new coordinates of the robot.

The string of directions corresponds to a string of operations done on the
robot:

- `U` for up ;
- `L` for left ;
- `D` for down ;
- `R` for right.

## Example

The output of `move_robot({1, 1}, "UL")` is the structure pair `{0, 2}`.
