module TestBinom where
    import Test.HUnit (Test(TestCase), assertEqual)
    import Lecture10 (binomIfElse, binomGuard)
    
    testBinomImplementation :: (Integer -> Integer -> Integer) -> Integer -> Integer -> Integer -> Test
    testBinomImplementation binom n k result =
        TestCase(assertEqual "" result (binom n k))

    binomTestCases :: [Test]
    binomTestCases = [
            -- test base case
            testBinomImplementation binomIfElse 0 0 1,
            testBinomImplementation binomGuard 0 0 1,

            -- test with sample
            testBinomImplementation binomIfElse 4 2 6,
            testBinomImplementation binomGuard 4 2 6,

            -- test with edge case
            testBinomImplementation binomIfElse 42 42 1,
            testBinomImplementation binomGuard 42 42 1
        ]