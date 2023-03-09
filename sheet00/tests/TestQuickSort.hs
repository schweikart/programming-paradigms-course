module TestQuickSort where
    import Test.HUnit (Test(TestCase), assertEqual)
    import Lecture10 (qSortListComp, qSortAnonymous, qSortPartial)
    
    sortedList = [0..10]
    unsortedList = [10, 3, 4, 2, 7, 5, 9, 0, 1, 6, 8]

    testQuickSortImplementation :: ([Integer] -> [Integer]) -> [Integer] -> [Integer] -> Test
    testQuickSortImplementation quickSort sorted unsorted =
        TestCase(assertEqual "" sorted (quickSort unsorted))

    quickSortTestCases :: [Test]
    quickSortTestCases = [
            -- test base case
            testQuickSortImplementation qSortListComp [] [],
            testQuickSortImplementation qSortAnonymous [] [],
            testQuickSortImplementation qSortPartial [] [],

            -- test recursion case
            testQuickSortImplementation qSortListComp sortedList unsortedList,
            testQuickSortImplementation qSortAnonymous sortedList unsortedList,
            testQuickSortImplementation qSortPartial sortedList unsortedList
        ]