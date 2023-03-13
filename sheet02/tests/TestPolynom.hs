module TestPolynom (polynomialTestCases) where
    import Polynom (cmult, eval)
    import TestUtils (testEq)

    cmultTests = [
            testEq "[] `cmult` 2 == []" [] $ [] `cmult` 2,
            testEq "[1, 2, 3] `cmult` 1 == [1, 2, 3]" [1, 2, 3] $ [1, 2, 3] `cmult` 1,
            testEq "[1, 2, 3] `cmult` 2 == [2, 4, 6]" [2, 4, 6] $ [1, 2, 3] `cmult` 2,
            testEq "[1, 2, 3] `cmult` 0 == []" [] $ [1, 2, 3] `cmult` 0,
            testEq "[] `cmult` 0 == []" [] $ [] `cmult` 0
        ]

    evalTests = [
            -- degree -infty
            testEq "eval [] 10 == 0" 0 $ eval [] 10,

            -- degree 0
            testEq "eval [5] 10 == 5" 5 $ eval [5] 10,
            testEq "eval [5] 3.14 == 5" 5 $ eval [5] 3.14,

            -- degree 2
            testEq "eval [10, -5] 5 == -15" (-15) $ eval [10, -5] 5,
            testEq "eval [10, -5] 0 == 10" 10 $ eval [10, -5] 0,

            -- degree 3
            testEq "eval [0, 0, -1]  0 == 0" 0 $ eval [0, 0, -1] 0,
            testEq "eval [0, 0, -1]  1 == -1" (-1) $ eval [0, 0, -1] 1,
            testEq "eval [0, 0, -1] -1 == -1" (-1) $ eval [0, 0, -1] (-1),
            
            testEq "eval [1, 2, 3]  0 == 1" 1 $ eval [1, 2, 3] 0,
            testEq "eval [1, 2, 3]  1 == 6" 6 $ eval [1, 2, 3] 1,
            testEq "eval [1, 2, 3] -1 == 2" 2 $ eval [1, 2, 3] (-1)
        ]

    polynomialTestCases = cmultTests ++ evalTests
