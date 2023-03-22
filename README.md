# NthComb


```julia
"""
`nthcomb(a,k,m)`
Compute the `m`th lexicographic combination of size `k` from collection `a`. equivalent to `collect(combinations(a,k))[m]`
"""
```

```julia
"""
`nthcomb(n,k,m)`

Compute the `m`th lexicographic combination of size `k` from collection with `n`
elements with assumed values `1:n`. equivalent to
`collect(combinations(1:n,k))[m]`
    
"""
```
