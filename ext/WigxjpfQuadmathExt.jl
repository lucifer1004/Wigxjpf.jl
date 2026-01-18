module WigxjpfQuadmathExt

using Wigxjpf
using Wigxjpf.Wigxjpf_jll
using Quadmath

# Check if Float128 is actually supported on this platform
# Float128 requires x86/x86_64 AND (Linux or Windows)
# macOS (both Intel and Apple Silicon) does not support Float128
const FLOAT128_SUPPORTED = (Sys.ARCH ∈ (:x86_64, :i686)) && (Sys.islinux() || Sys.iswindows())

function _check_float128_support()
    return if !FLOAT128_SUPPORTED
        error(
            """
            Float128 is not available on this platform.

            Float128 support requires x86/x86_64 architecture with libquadmath
            AND a supported operating system (Linux or Windows).

            Available precision levels:
              - Float64 (64-bit): Use wig3jj() and similar functions
              - BigFloat (arbitrary precision): Use BigFloat for higher precision

            Float128 is only available on:
              - x86_64 Linux
              - x86_64 Windows (including i686)

            Float128 is NOT available on:
              - macOS (all versions, Intel and Apple Silicon)
              - ARM/AArch64 architectures

            Your platform: $(Sys.MACHINE) ($(Sys.islinux() ? "Linux" : Sys.iswindows() ? "Windows" : Sys.isapple() ? "macOS" : "Unknown OS"))
            """
        )
    end
end

# Export Float128 versions
export wig3jj, wig6jj, wig9jj
export wig_table_init, wig_temp_init, wig_thread_temp_init
export wig_table_free, wig_temp_free

"""
    wig_table_init(::Type{Float128}, max_two_j::Integer, wigner_type::Integer)

Initialize the Float128 calculation table. Must be called before evaluating any Float128 Wigner symbols.

Note: This initializes the table for `libwigxjpf_quadmath`, which is separate from the Float64 library.
"""
function Wigxjpf.wig_table_init(::Type{Float128}, max_two_j::Integer, wigner_type::Integer)
    _check_float128_support()
    @assert max_two_j >= 0
    @assert wigner_type ∈ [3, 6, 9]
    return ccall(
        (:wig_table_init, libwigxjpf_quadmath), Cvoid, (Int32, Int32),
        convert(Int32, max_two_j), convert(Int32, wigner_type)
    )
end

"""
    wig_temp_init(::Type{Float128}, max_two_j::Integer)

Initialize the Float128 temporary array. Must be called before evaluating any Float128 Wigner symbols.

Note: In multi-threaded environments, use `wig_thread_temp_init(Float128, ...)` instead.
"""
function Wigxjpf.wig_temp_init(::Type{Float128}, max_two_j::Integer)
    _check_float128_support()
    @assert max_two_j >= 0
    return ccall(
        (:wig_temp_init, libwigxjpf_quadmath), Cvoid, (Int32,),
        convert(Int32, max_two_j)
    )
end

"""
    wig_thread_temp_init(::Type{Float128}, max_two_j::Integer)

Initialize the Float128 temporary array for the current thread.

Note: In multi-threaded environments, this should be called in each thread.
"""
function Wigxjpf.wig_thread_temp_init(::Type{Float128}, max_two_j::Integer)
    _check_float128_support()
    @assert max_two_j >= 0
    return ccall(
        (:wig_thread_temp_init, libwigxjpf_quadmath), Cvoid, (Int32,),
        convert(Int32, max_two_j)
    )
end

"""
    wig_temp_free(::Type{Float128})

Free the Float128 temporary array.

Note: In multi-threaded environments, this should be called in each thread.
"""
function Wigxjpf.wig_temp_free(::Type{Float128})
    _check_float128_support()
    return ccall((:wig_temp_free, libwigxjpf_quadmath), Cvoid, ())
end

"""
    wig_table_free(::Type{Float128})

Free the Float128 calculation table.

Note: In multi-threaded environments, this should be called globally after all threads complete.
"""
function Wigxjpf.wig_table_free(::Type{Float128})
    _check_float128_support()
    return ccall((:wig_table_free, libwigxjpf_quadmath), Cvoid, ())
end

@doc raw"""
```
wig3jj(::Type{Float128}, two_j1::Integer, two_j2::Integer, two_j3::Integer,
       two_m1::Integer, two_m2::Integer, two_m3::Integer)
```

Evaluate Wigner 3-j symbols with Float128 (quad) precision.

Note that all parameters are twice the actual j or m parameters to allow representation of half-integers.

Requires `using Quadmath` to enable Float128 support.

**Platform Support:** x86/x86_64 Linux and Windows only. Not available on macOS or ARM.
"""
function Wigxjpf.wig3jj(
        ::Type{Float128},
        two_j1::Integer, two_j2::Integer, two_j3::Integer,
        two_m1::Integer, two_m2::Integer, two_m3::Integer
    )
    _check_float128_support()
    result = Ref{Float128}(0)
    ccall(
        (:wig3jj_float128, libwigxjpf_quadmath), Cvoid,
        (Ptr{Float128}, Int32, Int32, Int32, Int32, Int32, Int32),
        result,
        convert(Int32, two_j1), convert(Int32, two_j2), convert(Int32, two_j3),
        convert(Int32, two_m1), convert(Int32, two_m2), convert(Int32, two_m3)
    )
    return result[]
end

@doc raw"""
```
wig6jj(::Type{Float128}, two_j1::Integer, two_j2::Integer, two_j3::Integer,
       two_j4::Integer, two_j5::Integer, two_j6::Integer)
```

Evaluate Wigner 6-j symbols with Float128 (quad) precision.

Note that all parameters are twice the actual j parameters to allow representation of half-integers.

Requires `using Quadmath` to enable Float128 support.

**Platform Support:** x86/x86_64 Linux and Windows only. Not available on macOS or ARM.
"""
function Wigxjpf.wig6jj(
        ::Type{Float128},
        two_j1::Integer, two_j2::Integer, two_j3::Integer,
        two_j4::Integer, two_j5::Integer, two_j6::Integer
    )
    _check_float128_support()
    result = Ref{Float128}(0)
    ccall(
        (:wig6jj_float128, libwigxjpf_quadmath), Cvoid,
        (Ptr{Float128}, Int32, Int32, Int32, Int32, Int32, Int32),
        result,
        convert(Int32, two_j1), convert(Int32, two_j2), convert(Int32, two_j3),
        convert(Int32, two_j4), convert(Int32, two_j5), convert(Int32, two_j6)
    )
    return result[]
end

@doc raw"""
```
wig9jj(::Type{Float128}, two_j1::Integer, two_j2::Integer, two_j3::Integer,
       two_j4::Integer, two_j5::Integer, two_j6::Integer,
       two_j7::Integer, two_j8::Integer, two_j9::Integer)
```

Evaluate Wigner 9-j symbols with Float128 (quad) precision.

Note that all parameters are twice the actual j parameters to allow representation of half-integers.

Requires `using Quadmath` to enable Float128 support.

**Platform Support:** x86/x86_64 Linux and Windows only. Not available on macOS or ARM.
"""
function Wigxjpf.wig9jj(
        ::Type{Float128},
        two_j1::Integer, two_j2::Integer, two_j3::Integer,
        two_j4::Integer, two_j5::Integer, two_j6::Integer,
        two_j7::Integer, two_j8::Integer, two_j9::Integer
    )
    _check_float128_support()
    result = Ref{Float128}(0)
    ccall(
        (:wig9jj_float128, libwigxjpf_quadmath), Cvoid,
        (Ptr{Float128}, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32),
        result,
        convert(Int32, two_j1), convert(Int32, two_j2), convert(Int32, two_j3),
        convert(Int32, two_j4), convert(Int32, two_j5), convert(Int32, two_j6),
        convert(Int32, two_j7), convert(Int32, two_j8), convert(Int32, two_j9)
    )
    return result[]
end

end # module
