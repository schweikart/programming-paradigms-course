module Collatz (collatz, num) where
    -- Task 2.1: Create stream of collatz sequence members for a given
    -- starting point.
    collatz :: Int -> [Int]
    collatz = iterate nextCollatzElement

    -- Computes the collatz sequence element after the given one
    nextCollatzElement a
        | even a    = a `div` 2
        | otherwise = 3 * a + 1

    -- Task 2.2: Finds the first index of a 1 in the collatz sequence starting
    -- with x.
    -- TODO: convert this to a tail recursive function
    num :: Int -> Int
    num x
        | x == 1    = 0
        | otherwise = 1 + num (nextCollatzElement x)
