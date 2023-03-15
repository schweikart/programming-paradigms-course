module TestRopes where
    import TestUtils (testEq)
    import Ropes (Rope(Inner, Leaf), ropeLength, ropeConcat, toList, ropeSplitAt, ropeInsert, ropeDelete)
    
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

    ropeInsertTests = [
            testEq "toList (ropeInsert 6 testRope testRope) == \"Hello,Hello, world! world!\"" "Hello,Hello, world! world!" $ toList (ropeInsert 6 testRope testRope),
            testEq "toList (ropeInsert 6 (fromList \" cruel\") testRope) == \"Hello, cruel world!" "Hello, cruel world!" $ toList (ropeInsert 6 (Leaf " cruel") testRope)
        ]
    
    ropeDeleteTests = [
            testEq "toList (ropeDelete 1 3 (fromList \"0123\")) == \"03\"" "03" $ toList (ropeDelete 1 3 (Leaf "0123")),
            testEq "toList (ropeDelete 1 12 testRope) == \"Hd!\"" "Hd!" $ toList (ropeDelete 1 11 testRope)
        ]

    ropesTestCases = ropeLengthTests ++ toListTests ++ ropeConcatTests ++ ropeSplitAtTests ++ ropeInsertTests ++ ropeDeleteTests
    