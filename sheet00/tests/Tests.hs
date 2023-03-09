import Test.HUnit (Test(TestLabel,TestCase, TestList),assertEqual)
import Test.HUnit.Lang (Assertion)
import Test.Framework (defaultMain)
import Test.Framework.Providers.HUnit (hUnitTestToTests)
import System.Exit (exitFailure)
import Lecture10 (qSortListComp, qSortAnonymous, qSortPartial)

sortedList = [0..10]
unsortedList = [10, 3, 4, 2, 7, 5, 9, 0, 1, 6, 8]

testQuickSortListComp = TestCase(assertEqual "result is sorted"
    sortedList (qSortListComp unsortedList))

testQuickSortImplementation :: ([Integer] -> [Integer]) -> [Integer] -> [Integer] -> Test
testQuickSortImplementation quickSort sorted unsorted =
    TestCase(assertEqual "" sorted (quickSort unsorted))

main :: IO ()
main = defaultMain (hUnitTestToTests (TestList [
        -- test base case
        testQuickSortImplementation qSortListComp [] [],
        testQuickSortImplementation qSortAnonymous [] [],
        testQuickSortImplementation qSortPartial [] [],

        -- test recursion case
        testQuickSortImplementation qSortListComp sortedList unsortedList,
        testQuickSortImplementation qSortAnonymous sortedList unsortedList,
        testQuickSortImplementation qSortPartial sortedList unsortedList
    ]))
