using NthComb
using Test

using Combinatorics
using StatsBase
using Random

@testset "NthComb.jl" begin
    # test
    n = 8
    k = 3
    @test [nthcomb(n,k,i) for i in 1:binomial(n,k)] == collect(combinations(1:n,k))
    @test [nthcomb(1:n,k,i) for i in 1:binomial(n,k)] == collect(combinations(1:n,k))
end