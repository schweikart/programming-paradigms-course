module TestUtils where
    import Test.Framework (defaultMain)
    import Test.Framework.Providers.HUnit (hUnitTestToTests)
    import Test.HUnit (Test(TestCase, TestLabel, TestList), assertEqual)

    testEq :: (Eq t, Show t) => String -> t -> t -> Test
    testEq msg expected actual = TestLabel msg (TestCase (assertEqual msg expected actual))

    runTests :: [Test] -> IO ()
    runTests tests = defaultMain (hUnitTestToTests (TestList tests))
