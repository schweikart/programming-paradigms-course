module TestChurch (churchTestCases) where
    import Church (church2list, list2church)
    import TestUtils (testEq)
    
    fromToListRoundtripTests = [
            testEq "convert [] to and from church lists" [] $ church2list (list2church ([] :: [Int])),
            testEq "convert [1,2,3] to and from church lists" [1,2,3] $ church2list (list2church [1,2,3])
        ]

    churchTestCases = fromToListRoundtripTests
