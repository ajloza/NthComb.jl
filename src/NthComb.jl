module NthComb

using StatsBase
using Combinatorics
using Random

export nthcomb


# n choose k, find leading index for `m`th lexicographic combination of size k, helper for nthcomb
function leadingidx(k::Integer,m::Integer)
        
    # TODO: binary search for test_n between k-1 and n

    # the leading index in the combination is the term n such that nCk < m
    test_n = k-1
    nCk = binomial(test_n,k)
    nCk_old = 0
    
    while nCk <= m
        nCk_old = nCk
        test_n+=1
        nCk = binomial(test_n,k)
    end
    return (test_n-1,m-nCk_old)

end

# return indices for 1:n indexed collection
"""
`nthcomb(n,k,m)`

Compute the `m`th lexicographic combination of size `k` from collection with `n` elements with assumed values `1:n`. equivalent to `collect(combinations(1:n,k))[m]`
    
"""
function nthcomb(n::Integer,k::Integer,m::Integer)

    # finds the combinadic of the dual of the index requested and then converts to the elements
    
    m = binomial(n,k)-m # convert to dual
    
    if m<0
        throw(ArgumentError("Reqeuested index m = $(binomial(n,k)-m), this is greater than the total number of combinations = $(binomial(n,k))."))
    end
    if n==k
        return 1:n
    end

    # non-recursive algorithm, note this finds the combinadic not the elements as might be produced by combinations(a,k)[m]
    cm = Vector{Int}(undef,k)
    for kidx in k:-1:1
        cm[k-kidx+1],m = leadingidx(kidx,m)
    end

    return(combinadic2element!(cm,n).+1)

end

"""
`nthcomb(a,k,m)`

Compute the `m`th lexicographic combination of size `k` from collection `a`. equivalent to `collect(combinations(a,k))[m]`
"""
function nthcomb(a::AbstractVector,k::Integer,m::Integer)
    em = nthcomb(length(a),k,m)
    return a[em]
end

function combinadic2element!(cm,n)
    cm = (n-1) .- cm
    return cm
end


end
