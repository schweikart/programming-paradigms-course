import TestUtils (runTests)
import TestAst (astTestCases)
import TestRopes (ropesTestCases)

main = runTests $ astTestCases ++ ropesTestCases

