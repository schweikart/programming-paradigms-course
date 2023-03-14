module TestCharCounter (charCounterTestCases) where
    import TestUtils (testEq)
    import CharCounter (countChar, countCharAcc)

    countCharTests = [
            -- countChar
            testEq "countChar 'a' \"Programmierparadigmen\" == 3" 3 $ countChar 'a' "Programmierparadigmen",
            testEq "countChar 'b' \"Haskell\" == 0" 0 $ countChar 'b' "Haskell",

            -- countCharAcc
            testEq "countCharAcc 'a' \"Programmierparadigmen\" == 3" 3 $ countCharAcc 'a' "Programmierparadigmen",
            testEq "countCharAcc 'b' \"Haskell\" == 0" 0 $ countCharAcc 'b' "Haskell"
        ]

    charCounterTestCases = countCharTests
