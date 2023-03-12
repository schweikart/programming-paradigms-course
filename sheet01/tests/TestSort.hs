module TestSort where
    import Sort (insert)
    import TestUtils (testEq)
    
    insertTests = [
            testEq "insert 10 [] == [10]" [10] (insert 10 []),
            testEq "insert 10 [10] == [10, 10]" [10, 10] (insert 10 [10]),
            testEq "insert 10 [0..9] == [0..10]" [0..10] (insert 10 [0..9]),
            testEq "insert 10 ([0..5] ++ [15..20]) == ([0..5] ++ [10] ++ [15..20])" ([0..5] ++ [10] ++ [15..20]) (insert 10 ([0..5] ++ [15..20]))
        ]
    
    sortTestCases = insertTests

