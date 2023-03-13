module TestFibs where
    import Fibs (fibs)
    import TestUtils (testEq)
    
    fibsTestCases = [
            testEq "fibs !! 0 == 0" 0 $ fibs !! 0,
            testEq "fibs !! 1 == 1" 1 $ fibs !! 1,
            testEq "fibs !! 2 == 1" 1 $ fibs !! 2,
            testEq "fibs !! 3 == 2" 2 $ fibs !! 3,
            testEq "fibs !! 4 == 3" 3 $ fibs !! 4,
            testEq "fibs !! 5 == 5" 5 $ fibs !! 5,
            testEq "fibs !! 6 == 8" 8 $ fibs !! 6,
            testEq "fibs !! 7 == 13" 13 $ fibs !! 7,
            testEq "fibs !! 8 == 21" 21 $ fibs !! 8,
            testEq "fibs !! 9 == 34" 34 $ fibs !! 9
        ]

