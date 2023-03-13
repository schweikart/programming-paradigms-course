module TestPolynom (polynomialTestCases) where
    import Polynom (cmult)
    import TestUtils (testEq)
    
    cmultTests = [
            testEq "[] `cmult` 2 == []" [] $ [] `cmult` 2,
            testEq "[1, 2, 3] `cmult` 1 == [1, 2, 3]" [1, 2, 3] $ [1, 2, 3] `cmult` 1,
            testEq "[1, 2, 3] `cmult` 2 == [2, 4, 6]" [2, 4, 6] $ [1, 2, 3] `cmult` 2,
            testEq "[1, 2, 3] `cmult` 0 == []" [] $ [1, 2, 3] `cmult` 0,
            testEq "[] `cmult` 0 == []" [] $ [] `cmult` 0
        ]
    
    polynomialTestCases = cmultTests
