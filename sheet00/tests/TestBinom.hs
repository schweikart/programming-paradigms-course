module TestBinom where
    import Test.HUnit (Test)
    import Lecture10 (binomIfElse, binomGuard)
    import TestUtils (testEq)
    
    binomTestCases :: [Test]
    binomTestCases = [
            -- test base case
            testEq "binomIfElse 0 0 == 1" 1 (binomIfElse 0 0),
            testEq "binomGuard 0 0 == 1" 1 (binomGuard 0 0),

            -- test with sample
            testEq "binomIfElse 4 2 == 6" 6 (binomIfElse 4 2),
            testEq "binomGuard 4 2 == 6" 6 (binomGuard 4 2),

            -- test with edge case
            testEq "binomIfElse 42 42 == 1" 1 (binomIfElse 42 42),
            testEq "binomGuard 42 42 == 1" 1 (binomGuard 42 42)
        ]