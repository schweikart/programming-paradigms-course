import TestUtils (runTests)
import TestArithmetik (arithmeticTestCases)
import TestSort (sortTestCases)
main = runTests (arithmeticTestCases ++ sortTestCases)
