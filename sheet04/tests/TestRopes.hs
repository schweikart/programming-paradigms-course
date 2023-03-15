module TestRopes where
    import TestUtils (testEq)
    import Ropes (Rope(Inner, Leaf), ropeLength)
    
    testRope = Inner (Leaf "Hello") 5
        (Inner (Leaf ", ") 3 (Leaf "orld!"))

    ropeLengthTests = [
            testEq "ropeLength Leaf \"test\" == 4" 4 $ ropeLength (Leaf "test"),
            testEq "ropeLength testRole == 13" 13 $ ropeLength testRope
        ]

    ropesTestCases = ropeLengthTests