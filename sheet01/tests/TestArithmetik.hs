module TestArithmetik where
    import TestUtils (testEq, testThrows)
    import Arithmetik (pow1, pow2, pow3, root)
    import Control.Exception (try, evaluate)
    
    pow1Tests = [
            testEq "pow1 2 10 == 1024" 1024 (pow1 2 10),
            testEq "pow1 10 10 == 10000000000" 10000000000 (pow1 10 10),
            testEq "pow1 99999 0 == 1" 1 (pow1 99999 0)
        ]
    
    pow2Tests = [
            testEq "pow2 2 10 == 1024" 1024 (pow2 2 10),
            testEq "pow2 10 10 == 10000000000" 10000000000 (pow2 10 10),
            testEq "pow2 99999 0 == 1" 1 (pow2 99999 0),
            testEq "pow2 14 15 == pow1 14 15" (pow1 14 15) (pow2 14 15),
            testThrows "pow2 10 -1 throws an error" (try (evaluate (pow2 10 (-1 :: Integer))))
        ]
    
    pow3Tests = [
            testEq "pow3 2 10 == 1024" 1024 (pow3 2 10),
            testEq "pow3 10 10 == 10000000000" 10000000000 (pow3 10 10),
            testEq "pow3 99999 0 == 1" 1 (pow3 99999 0),
            testEq "pow3 14 15 == pow1 14 15" (pow1 14 15) (pow3 14 15),
            testThrows "pow3 10 -1 throws an error" (try (evaluate (pow3 10 (-1 :: Integer))))
        ]
    
    rootTests = [
            -- tests for existing roots
            testEq "root 1 0 == 0" 0 (root 1 0),
            testEq "root 2 4 == 2" 2 (root 2 4),
            testEq "root 3 27 == 3" 3 (root 3 27),
            testEq "root 7 (pow3 7 9) == 9" 9 (root 7 (pow3 7 9)),

            -- tests for rounded roots
            testEq "root 2 5 == 2" 2 (root 2 5),        -- 2^2 ==  4 <=   5 <   8 = 2^3
            testEq "root 3 100 == 4" 4 (root 3 100),    -- 3^4 == 81 <= 100 < 243 = 3^5
            
            -- tests for invalid inputs
            testThrows "root should throw an error for negative radicands" (try (evaluate (root 1 (-1 :: Integer)))),
            testThrows "root should throw an error for non-positive exponents" (try (evaluate (root 0 1)))
        ]

    arithmeticTestCases = 
        pow1Tests ++
        pow2Tests ++
        pow3Tests ++
        rootTests
