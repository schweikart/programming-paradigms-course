module TestSort where
    import Sort (insert, insertSort, merge)
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
    
    mergeTests = [
            testEq "merge [] [] == []" [] (merge [] typedEmptyList),
            testEq "merge [10] [] == [10]" [10] (merge [10] []),
            testEq "merge [] [10] == [10]" [10] (merge [] [10]),
            testEq "merge [10] [10] == [10, 10]" [10, 10] (merge [10] [10]),
            testEq "merge [9] [10] == [9, 10]" [9, 10] (merge [9] [10]),
            testEq "merge [11] [10] == [10, 11]" [10, 11] (merge [11] [10]),
            testEq "merge [0,2,4,6,8] [1,3,5,7,9] == [0..9]" [0..9] (merge [0,2,4,6,8] [1,3,5,7,9]),
            testEq "merge [0,1,3,4,5] [2,3,5,6,9] == [0,1,2,3,3,4,5,5,6,9]" [0,1,2,3,3,4,5,5,6,9] (merge [0,1,3,4,5] [2,3,5,6,9]),
            testEq "merge [4,5] [0..9] == [0,1,2,3,4,4,5,5,6,7,8,9]" [0,1,2,3,4,4,5,5,6,7,8,9] (merge [4,5] [0..9])
        ]
    
    sortTestCases = insertTests ++ insertSortTests ++ mergeTests
