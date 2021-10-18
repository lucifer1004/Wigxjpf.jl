# Wigxjpf

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://lucifer1004.github.io/Wigxjpf.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://lucifer1004.github.io/Wigxjpf.jl/dev)
[![Build Status](https://github.com/lucifer1004/Wigxjpf.jl/workflows/CI/badge.svg)](https://github.com/lucifer1004/Wigxjpf.jl/actions)
[![Coverage](https://codecov.io/gh/lucifer1004/Wigxjpf.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/lucifer1004/Wigxjpf.jl)

# Introduction

[Wigxjpf.jl](https://github.com/lucifer1004/Wigxjpf.jl) is an unopinionated wrapper of [WIGXJPF](http://fy.chalmers.se/subatom/wigxjpf/), which evaluates Wigner 3j, 6j and 9j symbols accurately using prime factorisation and multi-word integer arithmetic.

# Example

```julia
using Wigxjpf

wig_table_init(200, 9)
wig_temp_init(200)

val3j = wig3jj(2 * 10, 2 * 15, 2 * 10, 2 * (-3), 2 * 12, 2 * (-9))

@show val3j # "val3j = 0.040013817682832936"

val6j = wig6jj(2 * 10, 2 * 15, 2 * 10, 2 * 7, 2 * 7, 2 * 9)

@show val6j # "val6j = 0.01033149734335741"

val9j = wig9jj(1, 2, 3, 4, 6, 8, 3, 6, 9)

@show val9j # "val9j = -0.003015611935232274"

wig_temp_free()
wig_table_free()
```

# Reference

The recommended way to refer to WIGXJPF, when used for computations that are published in a research article, is to cite the following paper:
H. T. Johansson and C. Forssén, *Fast and Accurate Evaluation of Wigner 3j, 6j, and 9j Symbols Using Prime Factorization and Multiword Integer Arithmetic*, [SIAM J. Sci. Comput.](https://www.siam.org/journals/sisc.php), [38(1) (2016)](http://epubs.siam.org/toc/sjoce3/38/1), [A376-A384](http://dx.doi.org/10.1137/15M1021908).
