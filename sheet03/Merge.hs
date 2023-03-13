module Merge where
    -- Task 3.1: merge two possibly infinite, ascendingly ordered lists into one
    -- (possibly infinite), ascendingly ordered list.
    merge :: [Integer] -> [Integer] -> [Integer]
    merge (x:xs) (y:ys)
        | x < y     = x : merge xs (y:ys)
        | otherwise = y : merge (x:xs) ys
    merge [] ys     = ys
    merge xs []     = xs

    -- Task 3.2: returns a sorted stream of powers p^i of all primes p for
    -- exponents 1 <= i <= p.
    primepowers :: Integer -> [Integer]
    primepowers n = foldr merge [] [map (^ i) primes | i <- [1..n]] where
        -- prime sieve implementation from the lecture, slightly modified
        primes :: [Integer]
        primes = sieve [2..]
        sieve [] = []
        sieve (p:xs)    = p : sieve (filter (not . multipleOf p) xs)
        multipleOf p x = x `mod` p == 0
