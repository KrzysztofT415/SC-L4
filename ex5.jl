#!/usr/bin/julia
#=
 - Author: Krzysztof Tałałaj
=#

include("Interpolations.jl")
using .Interpolations
using Plots

p1 = rysujNnfx(x -> ℯ^x, 0.0, 1.0, 5)
p2 = rysujNnfx(x -> ℯ^x, 0.0, 1.0, 10)
p3 = rysujNnfx(x -> ℯ^x, 0.0, 1.0, 15)
p4 = rysujNnfx(x -> x^2*sin(x), -1.0, 1.0, 5)
p5 = rysujNnfx(x -> x^2*sin(x), -1.0, 1.0, 10)
p6 = rysujNnfx(x -> x^2*sin(x), -1.0, 1.0, 15)
plot(p1, p2, p3, p4, p5, p6, layout = (2, 3), size = (1920, 1080))
