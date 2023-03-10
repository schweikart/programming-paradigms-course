module TestMax3 where
    import Max3 (max3if, max3guard, max3max)
    import TestUtils (testEq)

    max3testCases = [
            -- max3if
            testEq "max3if 10 20 30 == 30" 30 $ max3if 10 20 30,
            testEq "max3if 50 20 30 == 30" 50 $ max3if 50 20 30,
            testEq "max3if 50 100 30 == 30" 100 $ max3if 50 100 30,

            -- max3guard
            testEq "max3guard 10 20 30 == 30" 30 $ max3guard 10 20 30,
            testEq "max3guard 50 20 30 == 30" 50 $ max3guard 50 20 30,
            testEq "max3guard 50 100 30 == 30" 100 $ max3guard 50 100 30,

            -- max3max
            testEq "max3max 10 20 30 == 30" 30 $ max3max 10 20 30,
            testEq "max3max 50 20 30 == 30" 50 $ max3max 50 20 30,
            testEq "max3max 50 100 30 == 30" 100 $ max3max 50 100 30
        ]
