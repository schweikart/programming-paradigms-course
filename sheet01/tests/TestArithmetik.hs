module TestArithmetik where
    import TestUtils (testEq, testThrows)
    import Arithmetik (pow1, pow2, pow3)
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

    arithmeticTestCases = 
        pow1Tests ++
        pow2Tests ++
        pow3Tests