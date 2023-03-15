module TestRopes where
    import TestUtils (testEq)
    import Ropes (Rope(Inner, Leaf), ropeLength, ropeConcat, toList)
    
    testRope = Inner (Leaf "Hello") 5
        (Inner (Leaf ", w") 3 (Leaf "orld!"))

    ropeLengthTests = [
            testEq "ropeLength Leaf \"test\" == 4" 4 $ ropeLength (Leaf "test"),
            testEq "ropeLength testRope == 13" 13 $ ropeLength testRope
        ]

    toListTests = [
            testEq "toList (Leaf \"test\") == \"test\"" "test" $ toList (Leaf "test"),
            testEq "toList restRope == \"Hello, world\"" "Hello, world!" $ toList testRope
        ]

    ropeConcatTests = [
            testEq "toList (ropeConcat testRope testRope) == (toList testRope ++ toList testRope)" (toList testRope ++ toList testRope) $ toList (ropeConcat testRope testRope)
        ]

    ropesTestCases = ropeLengthTests ++ toListTests ++ ropeConcatTests
    