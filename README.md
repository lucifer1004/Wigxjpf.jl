# Wigxjpf

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://lucifer1004.github.io/Wigxjpf.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://lucifer1004.github.io/Wigxjpf.jl/dev)
[![Build Status](https://github.com/lucifer1004/Wigxjpf.jl/workflows/CI/badge.svg)](https://github.com/lucifer1004/Wigxjpf.jl/actions)
[![Coverage](https://codecov.io/gh/lucifer1004/Wigxjpf.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/lucifer1004/Wigxjpf.jl)

# Introduction

[Wigxjpf.jl](https://github.com/lucifer1004/Wigxjpf.jl) is an unopinionated wrapper of [WIGXJPF](http://fy.chalmers.se/subatom/wigxjpf/), which evaluates Wigner 3j, 6j and 9j symbols accurately using prime factorisation and multi-word integer arithmetic.

# Example

## Standard (Float64) Precision

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

## High (Float128) Precision

For higher precision calculations, use Float128 (requires Julia 1.9+ and x86/x86_64 architecture):

```julia
using Wigxjpf
using Quadmath  # Enables Float128 support

# Initialize Float128 library (separate from Float64)
wig_table_init(Float128, 200, 9)
wig_temp_init(Float128, 200)

# Pass Float128 as first argument for quad precision
val3j_f128 = wig3jj(Float128, 2 * 10, 2 * 15, 2 * 10, 2 * (-3), 2 * 12, 2 * (-9))

@show val3j_f128  # Returns Float128 with ~33 decimal digits of precision

wig_temp_free(Float128)
wig_table_free(Float128)
```

## Multi-threading

For multi-threaded applications, use `wig_thread_temp_init` instead of `wig_temp_init`:

```julia
using Wigxjpf

# Global initialization (once)
wig_table_init(200, 9)

# Parallel computation
Threads.@threads for i in 1:100
    # Initialize thread-local temp storage
    wig_thread_temp_init(200)

    # Compute in this thread
    val = wig3jj(2 * i, 2 * 10, 2 * 15, 0, 0, 0)

    # Clean up thread-local storage
    wig_temp_free()
end

# Global cleanup (once)
wig_table_free()
```

**Note:** Float128 is only available on x86/x86_64 Linux and Windows. Not available on macOS or ARM.

## Development

### Pre-commit Hooks

This project uses [pre-commit](https://pre-commit.com/) to maintain code quality. Install and set up:

```bash
pip install pre-commit
pre-commit install
```

The hooks will automatically run on `git commit` and check:

- End-of-file fixes
- Trailing whitespace
- TOML/YAML syntax
- Markdown linting (with auto-fix)
- Julia code formatting with [Runic](https://github.com/fredrikekre/Runic.jl)

To run manually:

```bash
pre-commit run --all-files
```

# Reference

The recommended way to refer to WIGXJPF, when used for computations that are published in a research article, is to cite the following paper:
H. T. Johansson and C. Forssén, *Fast and Accurate Evaluation of Wigner 3j, 6j, and 9j Symbols Using Prime Factorization and Multiword Integer Arithmetic*, [SIAM J. Sci. Comput.](https://www.siam.org/journals/sisc.php), [38(1) (2016)](http://epubs.siam.org/toc/sjoce3/38/1), [A376-A384](http://dx.doi.org/10.1137/15M1021908).
