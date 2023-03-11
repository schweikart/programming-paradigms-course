import TestQuickSort (quickSortTestCases)
import TestBinom (binomTestCases)
import TestFaculty (facultyTestCases)
import TestFibonacci (fibonacciTestCases)
import TestListFunctions (listFunctionsTestCases)
import TestControlFlow (controlFlowTestCases)
import TestLecture11 (lecture11tests)
import TestMax3 (max3testCases)
import TestUtils (runTests)

main :: IO ()
main = runTests (
        binomTestCases ++
        quickSortTestCases ++
        facultyTestCases ++
        fibonacciTestCases ++
        listFunctionsTestCases ++
        controlFlowTestCases ++
        lecture11tests ++
        max3testCases
    )
