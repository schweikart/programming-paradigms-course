import TestUtils (runTests)
import TestCharCounter (charCounterTestCases)
import TestExam (examTestCases)

main = runTests $ charCounterTestCases ++ examTestCases
