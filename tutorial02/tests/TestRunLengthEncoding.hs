module TestRunLengthEncoding (runLengthEncodingTestCases) where
    import RunLengthEncoding (splitWhen, group)
    import TestUtils (testEq)
    
    splitWhenTests = [
            testEq "splitWhen even [1,2,3,4,5] == ([1], [2,3,4,5])" ([1], [2,3,4,5]) $ splitWhen even [1,2,3,4,5],
            testEq "splitWhen (== ' ') \"Hello World!\" == (\"Hello\", \" World!\")" ("Hello", " World!") $ splitWhen (== ' ') "Hello World!"
        ]
    
    groupTests = [
            testEq "group [1,1,2,1,3,3,3] == [[1,1], [2], [1], [3,3,3]]" [[1,1], [2], [1], [3,3,3]] $ group [1,1,2,1,3,3,3],
            testEq "group \"aaabbacccc\" == [\"aaa\", \"bb\", \"a\", \"cccc\"]" ["aaa", "bb", "a", "cccc"] $ group "aaabbacccc"
        ]

    runLengthEncodingTestCases = splitWhenTests ++ groupTests
