import TestUtils (runTests)
import TestChurchNumbers (churchNumbersTestCases)
import TestChurchPair (churchPairTestCases)

main = runTests $ churchNumbersTestCases ++ churchPairTestCases
