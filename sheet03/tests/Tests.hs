import TestUtils (runTests)
import TestFibs (fibsTestCases)
import TestCollatz (collatzTestCases)
import TestMerge (mergeTestCases)

main = runTests $ fibsTestCases ++ collatzTestCases ++ mergeTestCases
