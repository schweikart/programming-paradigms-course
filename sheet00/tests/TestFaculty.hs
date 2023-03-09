module TestFaculty where
    import Test.HUnit (Test(TestCase), assertEqual)
    import Lecture10 (facultyNaive, facultyAccumulator)
    
    testFacultyImplementation :: (Integer -> Integer) -> Integer -> Integer -> Test
    testFacultyImplementation faculty n result = TestCase(assertEqual "" result (faculty n))

    facultyTestCases :: [Test]
    facultyTestCases = [
            -- test base case
            testFacultyImplementation facultyNaive 1 1,
            testFacultyImplementation facultyAccumulator 1 1,

            -- test recursive case
            testFacultyImplementation facultyNaive 6 720,
            testFacultyImplementation facultyAccumulator 6 720
        ]
