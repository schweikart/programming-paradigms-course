module TestCollatz (collatzTestCases) where
    import TestUtils (testEq)
    import Collatz (collatz, num, maxNum)
    
    collatzTests = [
            -- test first number
            testEq "head (collatz 1) == 1" 1 $ head (collatz 1),
            testEq "head (collatz 424824) == 424824" 424824 $ head (collatz 424824),

            -- test following number
            testEq "(collatz 1) !! 1 == 4" 4 $ collatz 1 !! 1,
            testEq "(collatz 2) !! 1 == 1" 1 $ collatz 2 !! 1,
            testEq "(collatz 3) !! 1 == 10" 10 $ collatz 3 !! 1,
            testEq "(collatz 4) !! 1 == 2" 2 $ collatz 4 !! 1,
            testEq "(collatz 5) !! 1 == 16" 16 $ collatz 5 !! 1,

            -- test for 42 until it reaches a 1
            testEq "(collatz 42) !! 0 == 42" 42 $ collatz 42 !! 0,
            testEq "(collatz 42) !! 1 == 21" 21 $ collatz 42 !! 1,
            testEq "(collatz 42) !! 2 == 64" 64 $ collatz 42 !! 2,
            testEq "(collatz 42) !! 3 == 32" 32 $ collatz 42 !! 3,
            testEq "(collatz 42) !! 4 == 16" 16 $ collatz 42 !! 4,
            testEq "(collatz 42) !! 5 ==  8"  8 $ collatz 42 !! 5,
            testEq "(collatz 42) !! 6 ==  4"  4 $ collatz 42 !! 6,
            testEq "(collatz 42) !! 7 ==  2"  2 $ collatz 42 !! 7,
            testEq "(collatz 42) !! 8 ==  1"  1 $ collatz 42 !! 8
        ]
    
    numTests = [
            testEq "num 1 ==  0"  0 $ num 1,
            testEq "num 2 ==  1"  1 $ num 2,
            testEq "num 3 ==  7"  7 $ num 3, -- (3), 10, 5, 16, 8, 4, 2
            testEq "num 4 ==  2"  2 $ num 4, -- (4), 2
            testEq "num 5 ==  5"  5 $ num 5,
            testEq "num 6 ==  8"  8 $ num 6, -- (6), 3
            testEq "num 7 == 16" 16 $ num 7, -- (7), 22, 11, 34, 17, 52, 26, 13, 40, 20
            testEq "num 8 ==  3"  3 $ num 8,
            testEq "num 9 == 19" 19 $ num 9, -- (9), 28, 14, 7
            testEq "num 10 == 6"  6 $ num 10,

            testEq "num 42 == 8" 8 $ num 42
        ]
    
    maxNumTests = [
            testEq "maxNum " (9, 19) $ maxNum 1 10
        ]

    collatzTestCases = collatzTests ++ numTests ++ maxNumTests
