module Arithmetik where
    -- Task 1.1: simple pow implementation for integers
    -- time complexity: O(e)
    pow1 b e
        | e == 0    = 1
        | e > 0     = b * pow1 b (e-1)
        | otherwise = error "negative exponent"

    -- Task 1.2: more efficient pow implementation taking advantage of the
    -- following equation: b^(2e) = (b^2)^e.
    -- time complexity: O(log2 e)
    pow2 b e
        | e < 0     = error "negative exponent"
        | e == 0    = 1
        | even e    = pow2 (b * b) (e `div` 2)
        | otherwise = b * pow2 b (e-1)

    -- Task 1.3: tail recursive implementation of pow2
    pow3 b e
        | e < 0     = error "negative exponent"
        | otherwise = pow3acc b e 1 where
            pow3acc b' e' acc
                | e' == 0   = acc
                | even e'   = pow3acc (b' * b') (e' `div` 2) acc
                | otherwise = pow3acc b' (e' - 1) (acc * b')
