using BinaryBuilder

try
    @show readdir("products32")
    @show readdir("products32/bin")
end

file, hash = package(Prefix("products32"), "MySQL"; platform=Windows(:i686), verbose=true, force=true)
file2, hash2 = package(Prefix("products64"), "MySQL"; platform=Windows(:x86_64), verbose=true, force=true)

@show readdir()

println("""
Windows(:i686) => (\"\$bin_prefix/$file\", \"$hash\"),
Windows(:x86_64) => (\"\$bin_prefix/$file2\", \"$hash2\")
""")