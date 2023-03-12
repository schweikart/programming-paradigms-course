module TestSort where
    import Sort (insert, insertSort)
    import TestUtils (testEq)

    typedEmptyList :: [Integer]
    typedEmptyList = [];
    
    insertTests = [
            testEq "insert 10 [] == [10]" [10] (insert 10 []),
            testEq "insert 10 [10] == [10, 10]" [10, 10] (insert 10 [10]),
            testEq "insert 10 [0..9] == [0..10]" [0..10] (insert 10 [0..9]),
            testEq "insert 10 ([0..5] ++ [15..20]) == ([0..5] ++ [10] ++ [15..20])" ([0..5] ++ [10] ++ [15..20]) (insert 10 ([0..5] ++ [15..20]))
        ]
    
    insertSortTests = [
            testEq "insertSort [] == []" [] (insertSort typedEmptyList),
            testEq "insertSort [10] == [10]" [10] (insertSort [10]),
            testEq "insertSort (reverse [0..10]) == [0..10]" [0..10] (insertSort (reverse [0..10])),
            testEq "insertSort [8,4,2,6,1,4,3,7,3] == [1,2,3,3,4,4,6,7,8]" [1,2,3,3,4,4,6,7,8] (insertSort [8,4,2,6,1,4,3,7,3])
        ]
    
    sortTestCases = insertTests ++ insertSortTests
