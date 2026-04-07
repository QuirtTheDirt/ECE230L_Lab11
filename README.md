# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
Triston Sinclair, Gabriel Jones, Isaac Larsen
## Summary
In this lab, we made two types of clock dividers using D flipflops and T flipflops. The ripple counter divides an input clock signal by two for each layer it has, and the modulo counter is used to count repeatedly from 0 to some number.
## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
A single hertz is defined by both a falling AND rising edge, so two full counts through the modulo counter is equal to one hertz.

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
The circuit initially waits for a rising edge signal, and when it receives one, the signal ripples through the entire counter and enables all of the flipflops.

### 3 - What width of ring counter would you use to get to an output of ~1KHz?
Starting from a 100MHz signal, a 17 wide ripple counter will result in a ~0.75KHz signal (100000*2^-17)
