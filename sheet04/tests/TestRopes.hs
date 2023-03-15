module TestRopes where
    import TestUtils (testEq)
    import Ropes (Rope(Inner, Leaf), ropeLength, ropeConcat, toList, ropeSplitAt)
    
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
    
    ropeSplitAtTests = [
            testEq "toList (fst (ropeSplitAt 6 testRope)) == \"Hello,\"" "Hello," $ toList (fst (ropeSplitAt 6 testRope)),
            testEq "toList (snd (ropeSplitAt 6 testRope)) == \" world! \"" " world!" $ toList (snd (ropeSplitAt 6 testRope))
        ]

    ropesTestCases = ropeLengthTests ++ toListTests ++ ropeConcatTests ++ ropeSplitAtTests
    