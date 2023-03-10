module TestFaculty where
    import Test.HUnit (Test)
    import Lecture10 (facultyNaive, facultyAccumulator)
    import TestUtils (testEq)
    
    facultyTestCases :: [Test]
    facultyTestCases = [
            -- test base case
            testEq "facultyNaive 1 == 1" 1 (facultyNaive 1),
            testEq "facultyAccumulator 1 == 1" 1 (facultyAccumulator 1),

            -- test recursive case
            testEq "facultyNaive 6 == 720" 720 (facultyNaive 6),
            testEq "facultyAccumulator 6 == 720" 720 (facultyAccumulator 6)
        ]
