module Collatz where
    -- Task 2.1: Create stream of collatz sequence members for a given
    -- starting point.
    collatz :: Int -> [Int]
    collatz = iterate nextA where
        nextA a
            | even a    = a `div` 2
            | otherwise = 3 * a + 1
