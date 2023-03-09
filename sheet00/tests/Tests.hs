import Test.HUnit (Test(TestList))
import Test.Framework (defaultMain)
import Test.Framework.Providers.HUnit (hUnitTestToTests)

import Lecture10 (qSortListComp, qSortAnonymous, qSortPartial)

import TestQuickSort (quickSortTestCases)
import TestBinom (binomTestCases)

main :: IO ()
main = defaultMain (hUnitTestToTests (TestList (binomTestCases ++ quickSortTestCases)))
