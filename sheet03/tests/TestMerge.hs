module TestMerge (mergeTestCases) where
    import TestUtils (testEq)
    import Merge (merge, primepowers)
    
    mergeTests = [
            testEq "take 10 (merge [0..] [0..]) == [0,0,1,1,2,2,3,3,4,4]" [0,0,1,1,2,2,3,3,4,4] $ take 10 $ merge [0..] [0..],
            testEq "take 10 (merge [0..] [2]) == [0,1,2,2,3,4,5,6,7,8]" [0,1,2,2,3,4,5,6,7,8] $ take 10 $ merge [0..] [2],
            testEq "merge [1,2] [3,4] == [1..4]" [1..4] $ merge [1,2] [3,4]
        ]
    
    primepowersTests = [
            testEq "primepowers 0 == []" [] $ primepowers 0,
            testEq "take 10 (primepowers 1) == [2,3,5,7,11,13,17,19,23,29]" [2,3,5,7,11,13,17,19,23,29] $ take 10 $ primepowers 1,
            testEq "take 10 (primepowers 2) == [2,3,4,5,7,9,11,13,17,19]" [2,3,4,5,7,9,11,13,17,19] $ take 10 $ primepowers 2,
            testEq "take 10 (primepowers 3) == [2,3,4,5,7,8,9,11,13,17]" [2,3,4,5,7,8,9,11,13,17] $ take 10 $ primepowers 3,
            testEq "take 10 (primepowers 4) == [2,3,4,5,7,8,9,11,13,16]" [2,3,4,5,7,8,9,11,13,16] $ take 10 $ primepowers 4,
            testEq "take 10 (primepowers 5) == [2,3,4,5,7,8,9,11,13,16]" [2,3,4,5,7,8,9,11,13,16] $ take 10 $ primepowers 5,
            testEq "take 10 (primepowers 42) == [2,3,4,5,7,8,9,11,13,16]" [2,3,4,5,7,8,9,11,13,16] $ take 10 $ primepowers 42
        ]

    mergeTestCases = mergeTests ++ primepowersTests
