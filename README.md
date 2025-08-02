# string-calculator-application
Application to sum all the number separated by delimiters in different scenarios

## StringCalculator
This file implements a StringCalculator class that provides an add(numbers) method to sum numbers in a string. It supports:

Default delimiters: comma (,) and newline (\n)
Returns 0 for empty strings
Custom single or multi-character delimiters (e.g., //[***]\n1***2***3)
Ignores numbers greater than 1000 (uses number % 1000)
Raises an error if negative numbers are present
Multiple delimiters (e.g.,//[*][%]\n1*2%3)
Custom exceptions and helper methods are included for delimiter extraction and numeric validation.
