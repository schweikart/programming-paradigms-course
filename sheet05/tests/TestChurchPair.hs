module TestChurchPair (churchPairTestCases) where
    import TestUtils (testEq)
    import ChurchPair (cPair, cFst, cSnd)
    import ChurchNumbers (church2int, int2church)
    
    pairTests = [
            testEq "evaluate church pair (1,2) with +" 3 $ cPair 1 2 (+),
            testEq "evaluate church pair (1,2) with -" (-1) $ cPair 1 2 (-)
        ]
    
    fstTests = [
            testEq "cFst (cPair 1 2) == 1" 1 $ cFst (cPair 1 2),
            testEq "cFst (cPair c3 c5) == c3" 3 $ church2int (cFst (cPair (int2church 3) (int2church 5)))
        ]
    
    sndTests = [
            testEq "cSnd (cPair 1 2) == 2" 2 $ cSnd (cPair 1 2),
            testEq "cSnd (cPair c3 c5) == c5" 5 $ church2int (cSnd (cPair (int2church 3) (int2church 5)))
        ]

    churchPairTestCases = pairTests ++ fstTests ++ sndTests
