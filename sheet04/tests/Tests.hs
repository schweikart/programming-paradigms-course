import TestUtils (runTests)
import TestAst (astTestCases)
import TestRopes (ropesTestCases)
import TestRopeEditor (ropeEditorTestCases)

main = runTests $ astTestCases ++ ropesTestCases ++ ropeEditorTestCases

