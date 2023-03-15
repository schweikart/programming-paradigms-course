{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
-- to emphasize the comparison between lists and church lists, the actual values
-- in equality tests are computed in the same way as the correspoding church
-- operations
{-# HLINT ignore "Evaluate" #-}

module TestChurch (churchTestCases) where
    import Church (church2list, list2church, mapChurch, concatChurch)
    import TestUtils (testEq)

    fromToListRoundtripTests = [
            testEq "convert [] to and from church lists" [] $ church2list (list2church ([] :: [Int])),
            testEq "convert [1,2,3] to and from church lists" [1,2,3] $ church2list (list2church [1,2,3])
        ]
    
    square x = x * x

    mapTests = [
            testEq "mapChurch for []" (map (0 -) ([] :: [Int])) $ church2list (mapChurch (0-) (list2church [])),
            testEq "mapChurch for [0..10] and (0-)" (map (0 -) [0..10]) $ church2list (mapChurch (0-) (list2church [0..10])),
            testEq "mapChurch for [0..10] and square" (map square [0..10]) $ church2list (mapChurch square (list2church [0..10]))
        ]
    
    concatTests = [
            testEq "concatChurch for [] and []" ([] ++ ([] :: [Int])) $ church2list (concatChurch (list2church []) (list2church [])),
            testEq "concatChurch for [0..10] and [17..25]" ([0..10] ++ [17..25]) $ church2list (concatChurch (list2church [0..10]) (list2church [17..25]))
        ]

    churchTestCases = fromToListRoundtripTests ++ mapTests ++ concatTests
