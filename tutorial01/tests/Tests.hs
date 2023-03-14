import TestUtils (runTests)
import TestCharCounter (charCounterTestCases)
import TestExam (examTestCases)
import TestEuklid (euklidTests)

main = runTests $ charCounterTestCases ++ examTestCases ++ euklidTests
