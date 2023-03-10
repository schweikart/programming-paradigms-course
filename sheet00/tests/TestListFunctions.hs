module TestListFunctions where
    import Test.HUnit (Test(TestCase, TestLabel), assertEqual, Assertable (assert), assertBool)
    import Lecture10 (myLength, myElem, myMaxmimum)
    import Control.Exception (catch, evaluate, SomeException (SomeException), try)
    import Test.HUnit.Lang (Result(Error))
    import Data.Either (isLeft)
    
    emptyIntList :: [Int]
    emptyIntList = []
    
    testEq :: (Eq t, Show t) => String -> t -> t -> Test
    testEq msg expected actual = TestLabel msg (TestCase (assertEqual msg expected actual))

    listFunctionsTestCases :: [Test]
    listFunctionsTestCases = [
            -- lenght function
            testEq "myLength []" (length []) (myLength []),
            testEq "myLength [0..100]" (length [0..100]) (myLength [0..100]),

            -- elem function
            testEq "myElem 10 []" (elem 10 []) (myElem 10 []),
            testEq "myElem 10 [0..100]" (elem 10 [0..100]) (myElem 10 [0..100]),
            testEq "myElem 10 [10, 10]" (elem 10 [10, 10]) (myElem 10 [10, 10]),

            -- maximum function
            TestLabel "maximum [] throws an error" (TestCase (do
                    result <- try (evaluate (myMaxmimum emptyIntList)) :: IO (Either SomeException Int)
                    assertBool "maximum [] throws an error" (isLeft result)
                )),
            TestLabel "myMaximum [] throws an error" (TestCase (do
                    result <- try (evaluate (maximum emptyIntList)) :: IO (Either SomeException Int)
                    assertBool "myMaximum [] throws an error" (isLeft result)
                )),
            testEq "myMaximum [5]" (maximum [5]) (myMaxmimum [5]),
            testEq "myMaximum [0..100]" (maximum [0..100]) (myMaxmimum [0..100]),
            testEq "myMaximum [15, 5]" (maximum [15, 5]) (myMaxmimum [15, 5])
        ]