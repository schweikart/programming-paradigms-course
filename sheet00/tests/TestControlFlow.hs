module TestControlFlow where
    import Test.HUnit (Test)
    import TestUtils (testEq)
    import Lecture10 (myIfThenElse)

    controlFlowTestCases :: [Test]
    controlFlowTestCases = [
            testEq "myIfThenElse True 10 20" (if True then 10 else 20) (myIfThenElse True 10 20),
            testEq "myIfThenElse False 10 20" (if False then 10 else 20) (myIfThenElse False 10 20)
        ]
