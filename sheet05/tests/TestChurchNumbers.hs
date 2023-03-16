module TestChurchNumbers where
    import ChurchNumbers (church2int, int2church, cSucc)
    import TestUtils (testEq, testThrows)

    conversionRoundtripTests = [
            testEq ("church conversion roundtrip for i=" ++ show i) i $ church2int $ int2church i
        | i <- [0..10]]

    church2intTests = [
            testEq "church2int c_0 == 0" 0 $ church2int (\s z -> z),
            testEq "church2int c_5 == 5" 5 $ church2int (\s z -> s $ s $ s $ s $ s z)
        ]

    int2churchTests = [
            testEq "int2church 0 always returns z, for z='z'" 'z' $ int2church 0 id 'z',
            testEq "int2church 0 always returns z, for z=0" 0 $ int2church 0 id 0,
            testEq "int2church 0 always returns z, for z=[1..10]" [1..10] $ int2church 0 id [1..10],

            testEq "int2church 0 (++\"a\") [] == \"\"" [] $ int2church 0 (++"a") [],
            testEq "int2church 10 (++\"a\") [] == \"aaaaaaaaaa\"" (replicate 10 'a') $ int2church 10 (++"a") [],
            testEq "int2church 69 (\\x -> x - 1) 420 == 420 - 69" (420 - 69) $ int2church 69 (\x -> x - 1) 420,
            testEq "int2church 100 (+1) 0 == 100" 100 $ int2church 100 (+1) 0
        ]
    
    cSuccTests = [
            testEq "church2int (cSucc (int2Church 0)) == 1" 1 $ church2int (cSucc (int2church 0)),
            testEq "church2int (cSucc (int2Church 42)) == 43" 43 $ church2int (cSucc (int2church 42))
        ]

    churchNumbersTestCases = conversionRoundtripTests ++ church2intTests ++ int2churchTests ++ cSuccTests
