module TestRunLengthEncoding where
    import RunLengthEncoding (splitWhen)
    import TestUtils (testEq)
    
    runLengthEncodingTestCases = [
            testEq "splitWhen even [1,2,3,4,5] == ([1], [2,3,4,5])" ([1], [2,3,4,5]) $ splitWhen even [1,2,3,4,5],
            testEq "splitWhen (== ' ') \"Hello World!\" == (\"Hello\", \" World!\")" ("Hello", " World!") $ splitWhen (== ' ') "Hello World!"
        ]
