module Fibs where
    -- Task 1: create the infinite stream of all fibonacci numbers in ascending
    -- order.
    -- Time complexity for accessing the n-th element: Theta(n)
    -- (assuming additions time complexity is Theta(1))
    fibs :: [Integer]
    fibs = 0:1:fibsFrom 0 1 where
        fibsFrom nMinus2 nMinus1 = n : fibsFrom nMinus1 n where
            n = nMinus2 + nMinus1 
