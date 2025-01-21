# Unintended Latch in VHDL

This repository demonstrates a common error in VHDL code that leads to an unintended latch being inferred by synthesis tools. The error occurs due to improper handling of a signal in a process that is not fully driven. This can result in unexpected behavior and potential timing issues.

## Bug Description
The provided VHDL code contains a signal, `valid`, which is only assigned a value within the `rising_edge(clk)` condition of the process. This is problematic because outside of that condition, the signal is not assigned a value.  This means the synthesis tool will infer a latch to hold the previous value of `valid`, leading to potential issues.

## Solution
The solution involves ensuring that `valid` is assigned a value in all possible conditions within the process.  This will prevent the synthesis tool from inferring a latch and create more robust and predictable behavior.