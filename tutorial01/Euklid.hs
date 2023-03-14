module Euklid (gcd2) where
    -- Calculates the greatest common divisor using the Euklidean Algorithm
    gcd2 :: Int -> Int -> Int
    gcd2 a b
        | b <= 0            = error "a and b must be > 0"
        | a < b             = gcd2 b a -- switch order to ensure a > b
        | a `mod` b == 0    = b
        | otherwise         = gcd2 b r
        where r = a `mod` b