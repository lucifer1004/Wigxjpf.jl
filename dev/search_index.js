var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = Wigxjpf","category":"page"},{"location":"#Introduction","page":"Home","title":"Introduction","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Wigxjpf.jl is an unopinionated wrapper of WIGXJPF, which evaluates Wigner 3j, 6j and 9j symbols accurately using prime factorisation and multi-word integer arithmetic.","category":"page"},{"location":"#Usage","page":"Home","title":"Usage","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Similar to the Python wrapper pywigxjpf, the following 8 functions are exported.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [Wigxjpf]","category":"page"},{"location":"#Wigxjpf.wig3jj-NTuple{6, Integer}","page":"Home","title":"Wigxjpf.wig3jj","text":"wig3jj(two_j1::Integer, two_j2::Integer, two_j3::Integer, two_m1::Integer, two_m2::Integer, two_m3::Integer)\n\nEvaluate Wigner 3-j symbols. Note that all parameter are twice the actual j or m parameters to allow representation of half-integers.\n\n\n\n\n\n","category":"method"},{"location":"#Wigxjpf.wig6jj-NTuple{6, Integer}","page":"Home","title":"Wigxjpf.wig6jj","text":"wig6jj(two_j1::Integer, two_j2::Integer, two_j3::Integer, two_j4::Integer, two_j5::Integer, two_j6::Integer)\n\nEvaluate Wigner 6-j symbols. Note that all parameter are twice the actual j parameters to allow representation of half-integers.\n\n\n\n\n\n","category":"method"},{"location":"#Wigxjpf.wig9jj-NTuple{9, Integer}","page":"Home","title":"Wigxjpf.wig9jj","text":"wig9jj(two_j1::Integer, two_j2::Integer, two_j3::Integer, two_j4::Integer, two_j5::Integer, two_j6::Integer, two_j7::Integer, two_j8::Integer, two_j9::Integer)\n\nEvaluate Wigner 9-j symbols. Note that all parameter are twice the actual j parameters to allow representation of half-integers.\n\n\n\n\n\n","category":"method"},{"location":"#Wigxjpf.wig_table_free-Tuple{}","page":"Home","title":"Wigxjpf.wig_table_free","text":"wig_table_free()\n\nFree the calculation table. \n\nWhen used in a multi-threaded environment, this function should be called globally.\n\n\n\n\n\n","category":"method"},{"location":"#Wigxjpf.wig_table_init-Tuple{Integer, Integer}","page":"Home","title":"Wigxjpf.wig_table_init","text":"wig_table_init(max_two_j::Integer, wigner_type::Integer)\n\nInitialize the calculation table. Must be called before evaluating any Wigner symbols.\n\nmax_two_j is twice the highest absolute value of all j values to be evaluated.\n\nwigner_type should be 3, 6, or 9. When multiple types are to be used, you should use the highest value for this parameter. \n\nWhen used in a multi-threaded environment, this function should be called globally.\n\n\n\n\n\n","category":"method"},{"location":"#Wigxjpf.wig_temp_free-Tuple{}","page":"Home","title":"Wigxjpf.wig_temp_free","text":"wig_temp_free()\n\nFree the temporary array.\n\nWhen used in a multi-threaded environment, this function should be called in each thread.\n\n\n\n\n\n","category":"method"},{"location":"#Wigxjpf.wig_temp_init-Tuple{Integer}","page":"Home","title":"Wigxjpf.wig_temp_init","text":"wig_temp_init(max_two_j::Integer)\n\nInitialize the temporary array. Must be called before evaluating any Wigner symbols.\n\nWhen used in a multi-threaded environment, call wig_thread_temp_init instead.\n\n\n\n\n\n","category":"method"},{"location":"#Wigxjpf.wig_thread_temp_init-Tuple{Integer}","page":"Home","title":"Wigxjpf.wig_thread_temp_init","text":"wig_thread_temp_init(max_two_j::Integer)\n\nInitialize the temporary array. Must be called before evaluating any Wigner symbols.\n\nWhen used in a multi-threaded environment, this function should be called in each thread.\n\n\n\n\n\n","category":"method"},{"location":"#Example","page":"Home","title":"Example","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"using Wigxjpf\n\nwig_table_init(200, 9)\nwig_temp_init(200)\n\nval3j = wig3jj(2 * 10, 2 * 15, 2 * 10, 2 * (-3), 2 * 12, 2 * (-9))\n\n@show val3j # \"val3j = 0.040013817682832936\"\n\nval6j = wig6jj(2 * 10, 2 * 15, 2 * 10, 2 * 7, 2 * 7, 2 * 9)\n\n@show val6j # \"val6j = 0.01033149734335741\"\n\nval9j = wig9jj(1, 2, 3, 4, 6, 8, 3, 6, 9)\n\n@show val9j # \"val9j = -0.003015611935232274\"\n\nwig_temp_free()\nwig_table_free()","category":"page"},{"location":"#Reference","page":"Home","title":"Reference","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The recommended way to refer to WIGXJPF, when used for computations that are published in a research article, is to cite the following paper: H. T. Johansson and C. Forssén, Fast and Accurate Evaluation of Wigner 3j, 6j, and 9j Symbols Using Prime Factorization and Multiword Integer Arithmetic, SIAM J. Sci. Comput., 38(1) (2016), A376-A384.","category":"page"}]
}