module TestListFunctions where
    import Test.HUnit (Test(TestCase, TestLabel), assertEqual, Assertable (assert), assertBool)
    import Lecture10 (myLength, myElem, myMaxmimum, app, myReverse)
    import Control.Exception (catch, evaluate, SomeException (SomeException), try)
    import Test.HUnit.Lang (Result(Error))
    import Data.Either (isLeft)
    import TestUtils (testEq)


    emptyList :: [Integer]
    emptyList = [];
    
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
                    result <- try (evaluate (myMaxmimum [])) :: IO (Either SomeException Int)
                    assertBool "maximum [] throws an error" (isLeft result)
                )),
            TestLabel "myMaximum [] throws an error" (TestCase (do
                    result <- try (evaluate (maximum [])) :: IO (Either SomeException Int)
                    assertBool "myMaximum [] throws an error" (isLeft result)
                )),
            testEq "myMaximum [5]" (maximum [5]) (myMaxmimum [5]),
            testEq "myMaximum [0..100]" (maximum [0..100]) (myMaxmimum [0..100]),
            testEq "myMaximum [15, 5]" (maximum [15, 5]) (myMaxmimum [15, 5]),

            -- append function
            testEq "app [] [] == []" (emptyList ++ emptyList) (app emptyList emptyList),
            testEq "app [1] [] == [1]" ([1] ++ emptyList) (app [1] emptyList),
            testEq "app [] [1] == [1]" (emptyList ++ [1]) (app emptyList [1]),
            testEq "app [1, 2] [3, 4] == [1, 2, 3, 4]" ([1, 2] ++ [3, 4]) (app [1, 2] [3, 4]),

            -- reverse function
            testEq "myReverse [] == reverse []" (reverse emptyList) (myReverse emptyList),
            testEq "myReverse [1] == reverse [1]" (reverse [1]) (myReverse [1]),
            testEq "myReverse [1, 2] == reverse [1, 2]" (reverse [1, 2]) (myReverse [1, 2]),
            testEq "myReverse [1, 2, 3] == reverse [1, 2, 3]" (reverse [1, 2, 3]) (myReverse [1, 2, 3]),
            testEq "myReverse [1..10] == reverse [1..10]" (reverse [1..10]) (myReverse [1..10])
        ]
