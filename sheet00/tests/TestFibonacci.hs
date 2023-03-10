module TestFibonacci where
    import Test.HUnit (Test)
    import Lecture10 (fibonacciNaive, fibonacciAccumulator)
    import TestUtils (testEq)
    
    fibonacciTestCases :: [Test]
    fibonacciTestCases = [
            -- test base cases
            testEq "fibonacciNaive 0 == 0" 0 (fibonacciNaive 0),
            testEq "fibonacciAccumulator 0 == 0" 0 (fibonacciAccumulator 0),
            testEq "fibonacciNaive 1 == 1" 1 (fibonacciNaive 1),
            testEq "fibonacciAccumulator 1 == 1" 1 (fibonacciAccumulator 1),

            -- test recursive case
            testEq "fibonacciNaive 16 == 987" 987 (fibonacciNaive 16),
            testEq "fibonacciAccumulator 16 == 987" 987 (fibonacciAccumulator 16)
        ]
