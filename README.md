# Binary Multiplication Algorithms 
This repository contains Verilog implementations of two different binary multiplication algorithms: Booth's algorithm for signed binary multiplication and the shift and add algorithm for unsigned binary multiplication.
# Contents
> - Booth's Algorithm (Signed Binary Multiplication)
> - Shift and Add Algorithm (Unsigned Binary Multiplication)
> - Usage
> - Contributing

# Booth's Algorithm (Signed Binary Multiplication)
The sign_mul module in the **sig_mul.v** file implements the signed binary multiplication using Booth's algorithm. This algorithm efficiently handles signed multiplication using bit-pair recoding and shifting operations.

# Shift and Add Algorithm (Unsigned Binary Multiplication)
The unsigned_mul module in the **unsig_mul.v** file implements unsigned binary multiplication using the shift and add algorithm. This simple algorithm involves shifting the multiplicand and adding it repeatedly based on the multiplier bits.

# Usage
1. Clone the repo:
https://github.com/dip-0011/binary_multiplication.git
2. Test the codes using the testbenches written in the repo or can write your own testbenches
3. Use the codes in any verilog simulator

# Contributing
Contributions are welcome! If you find any issues or improvements, please feel free to open an issue or submit a pull request.
