import TestUtils (runTests)
import TestQueue (queueTestCases)
import TestTree (treeTestCases)

main = runTests $ queueTestCases ++ treeTestCases

