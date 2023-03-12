module TestUtils where
    import Test.Framework (defaultMain)
    import Test.Framework.Providers.HUnit (hUnitTestToTests)
    import Test.HUnit (Test(TestCase, TestLabel, TestList), assertEqual, Assertion, assertBool)
    import Control.Exception (SomeException)
    import Data.Either (isLeft)
    
    -- wraps assertEqual with a labeled test case
    testEq :: (Eq t, Show t) => String -> t -> t -> Test
    testEq msg expected actual = TestLabel msg (TestCase (assertEqual msg expected actual))

    -- wraps assertBool with a labeled test case
    testBool :: String -> Bool -> Test
    testBool msg actual = TestLabel msg (TestCase (assertBool msg actual))

    -- assertion that checks if a called function yields an exception
    -- pass the function call with 'try (evaluate (myFunction myArgs...))'
    assertThrows :: String -> IO (Either SomeException a) -> Assertion
    assertThrows msg tryEvaluate = do
        result <- tryEvaluate
        assertBool msg (isLeft result)
    
    -- wraps assertThrows with a labeled test case
    testThrows :: String -> IO (Either SomeException a) -> Test
    testThrows msg tryEvaluate = TestLabel msg (TestCase (assertThrows msg tryEvaluate))

    -- run the given HUnit test cases and exit successfully iff all test cases
    -- passed
    runTests :: [Test] -> IO ()
    runTests tests = defaultMain (hUnitTestToTests (TestList tests))
