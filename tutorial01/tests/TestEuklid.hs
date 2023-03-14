module TestEuklid where
    import TestUtils (testEq)
    import Euklid (gcd2)

    euklidTests = [
            testEq "gcd2 100 100 == 100" 100 $ gcd2 100 100,
            testEq "gcd2 69 42 == 3" 3 $ gcd2 69 42,
            testEq "gcd2 42 69 == 3" 3 $ gcd2 42 69,
            testEq "gcd2 420 69 == gcd 420 69" (gcd 420 69) $ gcd2 420 69
        ]
