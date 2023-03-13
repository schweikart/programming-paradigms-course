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
    num :: Int -> Int
    num x = numAcc x 0 where
        numAcc x acc -- use tail recursion
            | x == 1    = acc
            | otherwise = numAcc (nextCollatzElement x) (acc + 1)
