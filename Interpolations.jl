#=
 - Author: Krzysztof Tałałaj
=#
module Interpolations

function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
    local fx = Vector{Float64}(f)
    for i in 2:length(fx)
        for j in length(fx):-1:i
            fx[j] = (fx[j] - fx[j - 1]) / (x[j] - x[j - i + 1])
        end
    end
    fx
end
export ilorazyRoznicowe

function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
    local w = Vector{Float64}(fx)
    for i in (length(w) - 1):-1:1
        w[i] += (t - x[i]) * w[i + 1]
    end
    w[1]
end
export warNewton

function naturalna(x::Vector{Float64}, fx::Vector{Float64})
    local a, n = Vector{Float64}(reverse(fx)), length(fx)

    for i in 2:n
        a[i] = a[i - 1]
        for j in 1:i - 2
            a[i - j] = a[i - j - 1] - x[n - i + 1] * a[i - j]
        end
        a[1] = fx[n - i + 1] - x[n - i + 1] * a[1]
    end
    a
end
export naturalna

function rysujNnfx(f, a::Float64, b::Float64, t::Int)
    local d, x, ff, fx = (b - a) / t, Vector{Float64}(), Vector{Float64}(), Vector{Float64}()
    for i in 0:t
        push!(x, a + i * d)
        push!(ff, f(a + i * d))
    end
    p = plot(t -> warNewton(x, ilorazyRoznicowe(x, ff), t), xlims = (a, b), label = "Interpolated", lw = 2)
    plot!(p, f, label = "Actual", xlims = (a, b), linestyle = :dash)  
    p
end
export rysujNnfx


end # end of module
