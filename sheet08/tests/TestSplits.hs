module TestSplits where
    import Splits (splits)
    import TestUtils (testEq)
    
    splitsTestCases = [
            testEq "splits [1,2,3] finds all splits"
                [([], [1,2,3]), ([1], [2,3]), ([1,2], [3]), ([1,2,3], [])]
                $ splits [1,2,3]
        ]

