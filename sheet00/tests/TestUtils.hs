module TestUtils where
    import Test.HUnit (Test(TestLabel, TestCase), assertEqual)

    testEq :: (Eq t, Show t) => String -> t -> t -> Test
    testEq msg expected actual = TestLabel msg (TestCase (assertEqual msg expected actual))
