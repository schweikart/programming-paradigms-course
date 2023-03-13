module Collatz (collatz, num, maxNum) where
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

    -- Task 2.3: For maxNum a b (with integers a <= b), this function returns a
    -- tuple (m, num m) where a <= m <= b is the number so that num m is
    -- maximum.
    -- Example: For a=1 and b=1000, the collatz sequence starting with m=871
    -- has the maximum num. 
    maxNum :: Int -> Int -> (Int,Int)
    maxNum a b
        | a > b             = error "invalid range"
        | b - a == 1        = (a, numA)
        | numA > maxNumRest = (a, numA)
        | otherwise         = (maxIdxRest, maxNumRest)
        where
            (maxIdxRest, maxNumRest) = maxNum (a+1) b
            numA = num a
