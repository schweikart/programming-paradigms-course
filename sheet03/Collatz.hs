module Collatz where
    collatz :: Int -> [Int]
    collatz a = a : collatz nextA where
        nextA
            | even a    = a `div` 2
            | otherwise = 3 * a + 1
