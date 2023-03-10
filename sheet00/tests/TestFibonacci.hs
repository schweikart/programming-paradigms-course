module TestFibonacci where
    import Test.HUnit (Test(TestCase, TestLabel), assertEqual)
    import Lecture10 (fibonacciNaive, fibonacciAccumulator)

    testFibonacciImplementation :: (Integer -> Integer) -> Integer -> Integer -> Test
    testFibonacciImplementation fibonacci n result =
        TestCase (assertEqual "" result (fibonacci n))

    fibonacciTestCases :: [Test]
    fibonacciTestCases = [
            -- test base cases
            TestLabel "fibNaive 0 == 0" (testFibonacciImplementation fibonacciNaive 0 0),
            TestLabel "fibAcc 0 == 0" (testFibonacciImplementation fibonacciAccumulator 0 0),
            TestLabel "fibNaive 1 == 1" (testFibonacciImplementation fibonacciNaive 1 1),
            TestLabel "fibAcc 1 == 1" (testFibonacciImplementation fibonacciAccumulator 1 1),

            -- test recursive case
            TestLabel "fibNaive 16 == 987" (testFibonacciImplementation fibonacciNaive 16 987),
            TestLabel "fibAcc 16 == 987" (testFibonacciImplementation fibonacciAccumulator 16 987)
        ]
