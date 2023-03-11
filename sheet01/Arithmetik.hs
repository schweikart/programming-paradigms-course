module Arithmetik where
    -- Task 1.1: simple pow implementation for integers
    pow1 b e
        | e == 0    = 1
        | e > 0     = b * pow1 b (e-1)
        | otherwise = error "negative exponent"
