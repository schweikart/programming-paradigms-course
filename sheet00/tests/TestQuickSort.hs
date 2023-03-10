module TestQuickSort where
    import Test.HUnit (Test)
    import Lecture10 (qSortListComp, qSortAnonymous, qSortPartial)
    import TestUtils (testEq)
    
    emptyList :: [Integer]
    emptyList = []
    sortedList = [0..10]
    unsortedList = [10, 3, 4, 2, 7, 5, 9, 0, 1, 6, 8]

    quickSortTestCases :: [Test]
    quickSortTestCases = [
            -- test base case
            testEq "qSortListComp [] == []" emptyList (qSortListComp emptyList),
            testEq "qSortAnonymous [] == []" emptyList (qSortAnonymous emptyList),
            testEq "qSortPartial [] == []" emptyList (qSortPartial emptyList),

            -- test recursion case
            testEq "qSortListComp unsortedList == sortedList" sortedList (qSortListComp unsortedList),
            testEq "qSortAnonymous unsortedList == sortedList" sortedList (qSortAnonymous unsortedList),
            testEq "qSortPartial unsortedList == sortedList" sortedList (qSortPartial unsortedList)
        ]