```@meta
CurrentModule = Wigxjpf
```

# Introduction

[Wigxjpf.jl](https://github.com/lucifer1004/Wigxjpf.jl) is an unopinionated wrapper of [WIGXJPF](http://fy.chalmers.se/subatom/wigxjpf/), which evaluates Wigner 3j, 6j and 9j symbols accurately using prime factorisation and multi-word integer arithmetic.

# Usage

Similar to the Python wrapper [pywigxjpf](https://pypi.org/project/pywigxjpf/), the following 8 functions are exported.

## Standard (Float64) Precision

The default functions return `Float64` values:

```@index
```

```@autodocs
Modules = [Wigxjpf]
```

## High (Float128) Precision

For applications requiring higher precision than `Float64`, Float128 (quad precision) support is available through the [Quadmath.jl](https://github.com/JuliaMath/Quadmath.jl) package extension.

**Requirements:**

- Julia 1.9 or later (for package extensions)
- x86/x86_64 architecture
- Linux or Windows operating system
- `Quadmath.jl` package

**Note:** Float128 is **not available** on macOS (Intel or Apple Silicon) or ARM architectures due to lack of `libquadmath` support.

**Usage:**

```julia
using Wigxjpf
using Quadmath  # This enables Float128 support

wig_table_init(Float128, 200, 9)
wig_temp_init(Float128, 200)

# Use Float128 as the first argument to get quad precision
val3j_f128 = wig3jj(Float128, 2 * 10, 2 * 15, 2 * 10, 2 * (-3), 2 * 12, 2 * (-9))
val6j_f128 = wig6jj(Float128, 2 * 10, 2 * 15, 2 * 10, 2 * 7, 2 * 7, 2 * 9)
val9j_f128 = wig9jj(Float128, 1, 2, 3, 4, 6, 8, 3, 6, 9)

wig_temp_free(Float128)
wig_table_free(Float128)
```

Float128 provides approximately 33-34 decimal digits of precision (compared to 15-16 for Float64), which is beneficial for:

- Large angular momenta values where cancellation errors accumulate
- Applications requiring verified high-precision results
- Numerical stability analysis

## Multi-threading

For multi-threaded applications, each thread must initialize its own temporary storage using `wig_thread_temp_init`:

```julia
using Wigxjpf

# Global initialization (once, before spawning threads)
wig_table_init(200, 9)

# Parallel computation
results = Vector{Float64}(undef, 100)
Threads.@threads for i in 1:100
    # Initialize thread-local temporary storage
    wig_thread_temp_init(200)

    # Compute in this thread
    results[i] = wig3jj(2 * i, 2 * 10, 2 * 15, 0, 0, 0)

    # Clean up thread-local storage
    wig_temp_free()
end

# Global cleanup (once, after all threads complete)
wig_table_free()
```

**Important threading notes:**

- `wig_table_init()` must be called **once globally** before any threaded computation
- `wig_thread_temp_init()` must be called **in each thread** before computing
- `wig_temp_free()` must be called **in each thread** after computing
- `wig_table_free()` must be called **once globally** after all threads complete
- Float128 works with multi-threading (each thread handles Float128 independently)

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
