#!/usr/bin/julia
#=
 - Author: Krzysztof Tałałaj
=#

include("Interpolations.jl")
using .Interpolations
using Test

x = [3.0, 1.0, 5.0, 6.0]
f = [1.0, -3.0, 2.0, 4.0]
@testset "Interpolations tests" begin
    local fx
    @testset "ilorazyRoznicowe test" begin
        fx = ilorazyRoznicowe(x, f)
        @test fx == [1.0, 2.0, -0.375, 0.17500000000000002]
    end
    @testset "warNewton test" begin
        v = warNewton(x, fx, 3.0)
        @test v == 1.0
    end
    @testset "warNewton test" begin
        v = warNewton(x, fx, 1.0)
        @test v == -3.0
    end
    @testset "warNewton test" begin
        v = warNewton(x, fx, 5.0)
        @test v == 2.0
    end
    @testset "warNewton test" begin
        v = warNewton(x, fx, 6.0)
        @test v == 4.0
    end
    @testset "naturalna test" begin
        n = naturalna(x, fx)
        @test n == [-8.75, 7.525, -1.9500000000000002, 0.17500000000000002]
    end
end
