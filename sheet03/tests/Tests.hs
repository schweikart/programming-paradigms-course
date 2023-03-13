import TestUtils (runTests)
import TestFibs (fibsTestCases)
import TestCollatz (collatzTestCases)

main = runTests $ fibsTestCases ++ collatzTestCases
