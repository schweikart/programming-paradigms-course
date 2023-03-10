module TestLecture11 where
    import Test.HUnit (Test)
    import TestUtils (testEq)
    import Lecture11 (myMap, myFilter, comp, sumNaive, sumFoldr, sumFoldl, flatten, myZip)
    
    square x = x * x
    
    lecture11tests :: [Test]
    lecture11tests = [
            testEq "myMap works like map" (map square [0..100]) (myMap square [0..100]),
            testEq "myFilter works like filter" (filter even [0..100]) (myFilter even [0..100]),
            testEq "comp works like ." (map (negate . negate) [0..100]) (map (comp negate negate) [0..100]),
            testEq "sumNaive works like sum" (sum [0..100]) (sumNaive [0..100]),
            testEq "sumFoldr works like sum" (sum [0..100]) (sumFoldr [0..100]),
            testEq "sumFoldl works like sum" (sum [0..100]) (sumFoldl [0..100]),
            testEq "flatten works like concat" (concat [[0..n] | n <- [0..20]]) (flatten [[0..n] | n <- [0..20]]),
            testEq "myZip works like zip" (zip [0..100] [-100..0]) (myZip [0..100] [-100..0])
        ]
