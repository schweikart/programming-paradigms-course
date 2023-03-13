module TestMerge (mergeTestCases) where
    import TestUtils (testEq)
    import Merge (merge)
    
    mergeTests = [
            testEq "take 10 (merge [0..] [0..]) == [0,0,1,1,2,2,3,3,4,4]" [0,0,1,1,2,2,3,3,4,4] $ take 10 $ merge [0..] [0..],
            testEq "take 10 (merge [0..] [2]) == [0,1,2,2,3,4,5,6,7,8]" [0,1,2,2,3,4,5,6,7,8] $ take 10 $ merge [0..] [2],
            testEq "merge [1,2] [3,4] == [1..4]" [1..4] $ merge [1,2] [3,4]

        ]

    mergeTestCases = mergeTests
