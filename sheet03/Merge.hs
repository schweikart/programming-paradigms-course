module Merge where
    -- Task 3.1: merge two possibly infinite, ascendingly ordered lists into one
    -- (possibly infinite), ascendingly ordered list.
    merge :: [Integer] -> [Integer] -> [Integer]
    merge (x:xs) (y:ys)
        | x < y     = x : merge xs (y:ys)
        | otherwise = y : merge (x:xs) ys
    merge [] ys     = ys
    merge xs []     = xs
