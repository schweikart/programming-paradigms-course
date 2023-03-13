module TestPolynom (polynomialTestCases) where
    import Polynom (cmult, eval, derive)
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
    
    deriveTests = [
            -- degree -infty
            testEq "derive [] == []" [] $ derive [],

            -- degree 0
            testEq "derive [4] == []" [] $ derive [4],
            testEq "derive [pi] == []" [] $ derive [pi],

            -- degree 1
            testEq "derive [4, 10] == [10]" [10] $ derive [4, 10],
            testEq "derive [pi, e] == [e]" [exp 1] $ derive [pi, exp 1],

            -- degree 4, multiple times
            testEq "derive [1,1,1,1,1] == [1,2,3,4]" [1,2,3,4] $ derive [1,1,1,1,1],
            testEq "derive [1,2,3,4] == [2,6,12]" [2,6,12] $ derive [1,2,3,4],
            testEq "derive [2,6,12] == [6,24]" [6,24] $ derive [2,6,12],
            testEq "derive [6,24] == [24]" [24] $ derive [6,24],
            testEq "derive [24] == []" [] $ derive [24]
        ]

    polynomialTestCases = cmultTests ++ evalTests ++ deriveTests
