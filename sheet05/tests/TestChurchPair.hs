module TestChurchPair (churchPairTestCases) where
    import TestUtils (testEq)
    import ChurchPair (cPair)

    pairTests = [
            testEq "evaluate church pair (1,2) with +" 3 $ cPair 1 2 (+),
            testEq "evaluate church pair (1,2) with -" (-1) $ cPair 1 2 (-)
        ]

    churchPairTestCases = pairTests
