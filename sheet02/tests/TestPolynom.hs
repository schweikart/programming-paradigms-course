module TestPolynom (polynomialTestCases) where
    import Polynom (cmult)
    import TestUtils (testEq)
    
    cmultTests = [
            testEq "2 `cmult` [] == []" [] $ 2 `cmult` [],
            testEq "1 `cmult` [1, 2, 3]" [1, 2, 3] $ 1 `cmult` [1, 2, 3],
            testEq "2 `cmult` [1, 2, 3] == [2, 4, 6]" [2, 4, 6] $ 2 `cmult` [1, 2, 3],
            testEq "0 `cmult` [1, 2, 3] == []" [] $ 0 `cmult` [1, 2, 3]
        ]
    
    polynomialTestCases = cmultTests
