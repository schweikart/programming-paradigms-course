module Arithmetik where
    -- Task 1.1: simple pow implementation for integers
    -- time complexity: Theta(e)
    pow1 b e
        | e == 0    = 1
        | e > 0     = b * pow1 b (e-1)
        | otherwise = error "negative exponent"

    -- Task 1.2: more efficient pow implementation taking advantage of the
    -- following equation: b^(2e) = (b^2)^e.
    -- time complexity: Theta(log e)
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

    -- Task 1.4: integer root computation using binary search
    root e r
        | e <= 0    = error "non-positive exponent"
        | r < 0     = error "negative radicand"
        | otherwise = rootInterval 0 (r+1) where
            rootInterval a b
                | a >= b                = error "invalid boundaries"
                | b - a == 1            = a
                | pow3 e middle <= r    = rootInterval middle b -- equivalent to: middle <= root e r
                | otherwise             = rootInterval a middle 
                where middle = a + ((b - a) `div` 2)

    -- Task 1.5: prime number identification
    isPrime n
        | n < 2     = False
        | otherwise = isPrimeLoop (root 2 n) where
            isPrimeLoop factor
                | factor == 1           = True -- if we reach this point, we haven't found any factors!
                | n `mod` factor == 0   = False
                | otherwise             = isPrimeLoop (factor - 1)
