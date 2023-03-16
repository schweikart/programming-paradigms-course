module TestChurchPair (churchPairTestCases) where
    import TestUtils (testEq)
    import ChurchPair (cPair, cFst, cSnd, cNext, cPred, cSub)
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
    
    nextTests = [
            testEq "cFst (cNext (cPair c0 c0)) == c0" 0 $ church2int (cFst (cNext (cPair (int2church 0) (int2church 0)))),
            testEq "cFst (cNext (cPair c1 c1)) == c1" 1 $ church2int (cFst (cNext (cPair (int2church 1) (int2church 1)))),

            testEq "cFst (cNext (cPair c0 c15)) == c15" 15 $ church2int (cFst (cNext (cPair (int2church 0) (int2church 15)))),
            testEq "cSnd (cNext (cPair c0 c15)) == c16" 16 $ church2int (cSnd (cNext (cPair (int2church 0) (int2church 15)))),

            testEq "cFst (cNext (cPair c69 c420)) == c420" 420 $ church2int (cFst (cNext (cPair (int2church 69) (int2church 420)))),
            testEq "cSnd (cNext (cPair c69 c420)) == c421" 421 $ church2int (cSnd (cNext (cPair (int2church 69) (int2church 420))))
        ]
    
    predTest = [
            testEq "church2int (cPred (int2church 1))" 0 $ church2int (cPred (int2church 1)),
            testEq "church2int (cPred (int2church 420))" 419 $ church2int (cPred (int2church 420))
        ]
    
    subTest = [
            testEq "church2int (cSub (int2church 420) (int2church 69)) == 420 - 69" (420 - 69) $ church2int (cSub (int2church 420) (int2church 69))
        ]

    churchPairTestCases = pairTests ++ fstTests ++ sndTests ++ nextTests ++ predTest ++ subTest
