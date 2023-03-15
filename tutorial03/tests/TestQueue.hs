{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use ==" #-} -- for testing "/=""
module TestQueue (queueTestCases) where
    import Queue (Queue (Q), fromList, toList, enqueue, dequeue)
    import TestUtils (testEq, testBool)

    fromListTests = [
            testEq "fromList [] == Q [] []" (Q ([] :: [Int]) []) $ fromList [],
            testEq "fromList [1,2,3,4,5] == Q [1,2,3,4,5] []" (Q [1,2,3,4,5] []) $ fromList [1,2,3,4,5]
        ]

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

    enqueueTests = [
            testEq "(Q [1] []) == enqueue 1 (Q [] [])" (Q [1] []) $ enqueue 1 (Q [] []),
            testEq "(Q [1,2,4,3,5] []) == enqueue 5 (Q [1,2] [3,4])" (Q [1,2,4,3,5] []) $ enqueue 5 (Q [1,2] [3,4])
        ]

    dequeueTests = [
            testEq "(Just (1, Q [2] [3,4])) == dequeue (Q [1,2] [3,4])" (Just (1, Q [2] [3,4])) $ dequeue (Q [1,2] [3,4]),
            testEq "(Just (2, Q [] [3,4])) == dequeue (Q [2] [3,4])" (Just (2, Q [] [3,4])) $ dequeue (Q [2] [3,4]),
            testEq "(Just (4, Q [] [3])) == dequeue (Q [] [3,4])" (Just (4, Q [] [3])) $ dequeue (Q [] [3,4]),
            testEq "(Just (3, Q [] [])) == dequeue (Q [] [3])" (Just (3, Q [] [])) $ dequeue (Q [] [3]),
            testEq "Nothing == dequeue (Q [] [])" Nothing $ dequeue (Q [] ([] :: [Int]))
        ]

    equalityTests = [
            testEq "empty queues should be equal" (Q [] ([] :: [Int])) (Q [] []),
            testEq "(Q [1,2,3] [4,5]) == (Q [1,2,3] [4,5])" (Q [1,2,3] [4,5]) (Q [1,2,3] [4,5]),
            testEq "(Q [1,2,3] [5,4]) == (Q [1,2,3,4,5] [])" (Q [1,2,3] [5,4]) (Q [1,2,3,4,5] []),
            testEq "(Q [] [5,4,3,2,1]) == (Q [1,2,3,4,5] [])" (Q [1,2,3,4,5] []) (Q [] [5,4,3,2,1]),

            testBool "(Q [1,2,3] [4,5]) /= (Q [1,2,3] [5,4])" $ Q [1,2,3] [4,5] /= Q [1,2,3] [5,4]
        ]

    queueTestCases =
        fromListTests ++
        toListTests ++
        fromToListRoundtripTests ++
        enqueueTests ++
        dequeueTests ++
        equalityTests
