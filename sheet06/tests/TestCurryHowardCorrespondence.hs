module TestCurryHowardCorrespondence where
    import CurryHowardCorrespondence (andE1, And (..), andE2, orE, Or (..))
    import TestUtils (testEq)
    
    andTests = [
            testEq "andE1 can extract a value of the first type" False $ andE1 $ AndI False 0,
            testEq "andE1 can extract a value of the second type" 0 $ andE2 $ AndI False 0
        ]
    
    orTests = [
            testEq "orE can extract a value if only the first type was specified" "False" $ orE (OrI1 False) show (show :: (String, Char) -> String),
            testEq "orE can extract a value if only the second type was specified" "0" $ orE (OrI2 0) (show :: [Double] -> String) show
        ]

    curryHowardCorrespondenceTestCases = andTests ++ orTests
