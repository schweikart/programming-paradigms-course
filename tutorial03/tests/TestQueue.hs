{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use ==" #-} -- for testing /=
module TestQueue where
    import Queue (Queue (Q), fromList, toList)
    import TestUtils (testEq, testBool)

    fromListTests = [] -- TODO: implement after implementing Eq for Queue

    toListTests = [
            testEq "toList (Q [] []) == []" ([] :: [Int]) $ toList (Q [] []),
            testEq "toList (Q [1,2,3,4,5] []) == [1,2,3,4,5]" [1,2,3,4,5] $ toList (Q [1,2,3,4,5] []),
            testEq "toList (Q [1,2,3] [5,4]) == [1,2,3,4,5]" [1,2,3,4,5] $ toList (Q [1,2,3] [5,4]),
            testEq "toList (Q [] [5,4,3,2,1]) == [1,2,3,4,5]" [1,2,3,4,5] $ toList (Q [] [5,4,3,2,1])
        ]

    fromToListRoundtripTests = [
            testEq "toList (fromList []) == []" [] $ toList (fromList ([] :: [Int])),
            testEq "toList (fromList [1..10]) == [1..10]" [] $ toList (fromList ([] :: [Int]))
        ]

    enqueueTests = [] -- TODO: implement after implementing Eq
    dequeueTests = [] -- TODO: implement after implementing Eq

    equalityTests = [
            testEq "empty queues should be equal" (Q [] ([] :: [Int])) (Q [] []),
            testEq "(Q [1,2,3] [4,5]) == (Q [1,2,3] [4,5])" (Q [1,2,3] [4,5]) (Q [1,2,3] [4,5]),
            testEq "(Q [1,2,3] [5,4]) == (Q [1,2,3,4,5] [])" (Q [1,2,3] [5,4]) (Q [1,2,3,4,5] []),
            testEq "(Q [] [5,4,3,2,1]) == (Q [1,2,3,4,5] [])" (Q [1,2,3,4,5] []) (Q [] [5,4,3,2,1]),

            testBool "(Q [1,2,3] [4,5]) /= (Q [1,2,3] [5,4])" $ not $ Q [1,2,3] [4,5] /= Q [1,2,3] [5,4]
        ]

    queueTestCases =
        fromListTests ++
        toListTests ++
        fromToListRoundtripTests ++
        enqueueTests ++
        dequeueTests ++
        equalityTests
