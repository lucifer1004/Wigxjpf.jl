using Wigxjpf
using Documenter

DocMeta.setdocmeta!(Wigxjpf, :DocTestSetup, :(using Wigxjpf); recursive=true)

makedocs(;
    modules=[Wigxjpf],
    authors="Gabriel Wu <wuzihua@pku.edu.cn> and contributors",
    repo="https://github.com/lucifer1004/Wigxjpf.jl/blob/{commit}{path}#{line}",
    sitename="Wigxjpf.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://lucifer1004.github.io/Wigxjpf.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/lucifer1004/Wigxjpf.jl",
    devbranch="main",
)
