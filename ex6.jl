#!/usr/bin/julia
#=
 - Author: Krzysztof Tałałaj
=#

include("Interpolations.jl")
using .Interpolations
using Plots

p1 = rysujNnfx(x -> abs(x), -1.0, 1.0, 5)
p2 = rysujNnfx(x -> abs(x), -1.0, 1.0, 10)
p3 = rysujNnfx(x -> abs(x), -1.0, 1.0, 15)
p4 = rysujNnfx(x -> 1/(1+x^2), -5.0, 5.0, 5)
p5 = rysujNnfx(x -> 1/(1+x^2), -5.0, 5.0, 10)
p6 = rysujNnfx(x -> 1/(1+x^2), -5.0, 5.0, 15)
plot(p1, p2, p3, p4, p5, p6, layout = (2, 3), size = (1920, 1080))