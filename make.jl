using Documenter
using Boscia

# Function to copy contents of README.md to index.md
function copy_readme_to_index()
    readme_path = joinpath("..", "README.md")  # Adjusted path
    index_path = joinpath("src", "index.md")
    readme_content = read(readme_path, String)
    write(index_path, readme_content)
end

# Call the function to update index.md
copy_readme_to_index()

# Generate documentation
makedocs(
    sitename="Boscia.jl",
    modules=[Boscia],
    format=Documenter.HTML(repolink="https://github.com/saurabhintoml/Boscia.jl.git"),
    pages=[
        "Home" => "index.md",
        "How does it work?" => "basics.md",
        "Obtaining a transformation" => "how_to_run.md",
        "API Reference" => [
            "reference/0_reference.md",
            "reference/1_algorithms.md"
        ]
    ],
    warnonly=true
)

# Deploy documentation
deploydocs(
    repo="https://github.com/saurabhintoml/Boscia.jl.git",
    devbranch="main",
    devurl="dev",
    target="build",
    branch="gh-pages",
    versions=["stable" => "v^", "v#.#"],
    push_preview=true
)
