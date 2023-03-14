module TestExam (examTestCases) where
    import TestUtils (testEq)
    import Exam (average, results)
    examTestCases = [
            testEq "average results == 2.0" 2.0 $ average results
        ]
