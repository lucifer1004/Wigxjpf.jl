module Wigxjpf

using Wigxjpf_jll

export wig_table_init, wig_temp_init, wig_thread_temp_init, wig3jj, wig6jj, wig9jj, wig_table_free, wig_temp_free

@doc raw"""
```
wig_table_init(max_two_j::Integer, wigner_type::Integer)
```

Initialize the calculation table. Must be called before evaluating any Wigner symbols.

`max_two_j` is twice the highest absolute value of all `j` values to be evaluated.

`wigner_type` should be 3, 6, or 9. When multiple types are to be used, you should use the highest value for this parameter.

> When used in a multi-threaded environment, this function should be called **globally**.
"""
function wig_table_init(max_two_j::Integer, wigner_type::Integer)
    @assert max_two_j >= 0
    @assert wigner_type ∈ [3, 6, 9]

    return ccall((:wig_table_init, libwigxjpf), Cvoid, (Int32, Int32), convert(Int32, max_two_j), convert(Int32, wigner_type))
end

@doc raw"""
```
wig_temp_init(max_two_j::Integer)
```

Initialize the temporary array. Must be called before evaluating any Wigner symbols.

> When used in a multi-threaded environment, call `wig_thread_temp_init` instead.
"""
function wig_temp_init(max_two_j::Integer)
    @assert max_two_j >= 0

    return ccall((:wig_temp_init, libwigxjpf), Cvoid, (Int32,), convert(Int32, max_two_j))
end

@doc raw"""
```
wig_thread_temp_init(max_two_j::Integer)
```

Initialize the temporary array. Must be called before evaluating any Wigner symbols.

> When used in a multi-threaded environment, this function should be called in each thread.
"""
function wig_thread_temp_init(max_two_j::Integer)
    @assert max_two_j >= 0

    return ccall((:wig_thread_temp_init, libwigxjpf), Cvoid, (Int32,), convert(Int32, max_two_j))
end

@doc raw"""
```
wig3jj(two_j1::Integer, two_j2::Integer, two_j3::Integer, two_m1::Integer, two_m2::Integer, two_m3::Integer)
```

Evaluate Wigner 3-j symbols. Note that all parameter are twice the actual j or m parameters to allow representation of half-integers.
"""
function wig3jj(two_j1::Integer, two_j2::Integer, two_j3::Integer, two_m1::Integer, two_m2::Integer, two_m3::Integer)
    return ccall((:wig3jj, libwigxjpf), Cdouble, (Int32, Int32, Int32, Int32, Int32, Int32), convert(Int32, two_j1), convert(Int32, two_j2), convert(Int32, two_j3), convert(Int32, two_m1), convert(Int32, two_m2), convert(Int32, two_m3))
end

@doc raw"""
```
wig6jj(two_j1::Integer, two_j2::Integer, two_j3::Integer, two_j4::Integer, two_j5::Integer, two_j6::Integer)
```

Evaluate Wigner 6-j symbols. Note that all parameter are twice the actual j parameters to allow representation of half-integers.
"""
function wig6jj(two_j1::Integer, two_j2::Integer, two_j3::Integer, two_j4::Integer, two_j5::Integer, two_j6::Integer)
    return ccall((:wig6jj, libwigxjpf), Cdouble, (Int32, Int32, Int32, Int32, Int32, Int32), convert(Int32, two_j1), convert(Int32, two_j2), convert(Int32, two_j3), convert(Int32, two_j4), convert(Int32, two_j5), convert(Int32, two_j6))
end

@doc raw"""
```
wig9jj(two_j1::Integer, two_j2::Integer, two_j3::Integer, two_j4::Integer, two_j5::Integer, two_j6::Integer, two_j7::Integer, two_j8::Integer, two_j9::Integer)
```

Evaluate Wigner 9-j symbols. Note that all parameter are twice the actual j parameters to allow representation of half-integers.
"""
function wig9jj(two_j1::Integer, two_j2::Integer, two_j3::Integer, two_j4::Integer, two_j5::Integer, two_j6::Integer, two_j7::Integer, two_j8::Integer, two_j9::Integer)
    return ccall((:wig9jj, libwigxjpf), Cdouble, (Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32), convert(Int32, two_j1), convert(Int32, two_j2), convert(Int32, two_j3), convert(Int32, two_j4), convert(Int32, two_j5), convert(Int32, two_j6), convert(Int32, two_j7), convert(Int32, two_j8), convert(Int32, two_j9))
end

@doc raw"""
```
wig_temp_free()
```

Free the temporary array.

> When used in a multi-threaded environment, this function should be called in each thread.
"""
function wig_temp_free()
    return ccall((:wig_temp_free, libwigxjpf), Cvoid, ())
end

@doc raw"""
```
wig_table_free()
```

Free the calculation table.

> When used in a multi-threaded environment, this function should be called **globally**.
"""
function wig_table_free()
    return ccall((:wig_table_free, libwigxjpf), Cvoid, ())
end

end
