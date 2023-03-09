module Lecture10 where

-- Test function to check whether Haskell is installed correctly
helloWorld = putStr "Hello World!\n"

-- QuickSort implementation using list comprehensions
qSortListComp []        = []
qSortListComp (p:ps)    =      (qSortListComp [x | x <- ps, x <= p])
                          ++ p:(qSortListComp [x | x <- ps, x >  p])

-- QuickSort implementation using filters and anonymous functions
qSortAnonymous []       = []
qSortAnonymous (p:ps)   =      qSortAnonymous (filter (\x -> x <= p) ps)
                          ++ p:(qSortAnonymous (filter (\x -> x >  p) ps))

-- QuickSort implementation using filters and partial operator application
qSortPartial []         = []
qSortPartial (p:ps)     =      (qSortPartial (filter (<= p) ps))
                          ++ p:(qSortPartial (filter (>  p) ps))

-- binomial coefficient computation using Pascal's triangle formula and the
-- if-then-else function
binomIfElse n k =
    if k == 0 || k == n
    then 1
    else binomIfElse (n-1) (k-1) + binomIfElse (n-1) k

-- binomial coefficient computation using Pascal's triangle formula and the
-- guard notation
binomGuard n k
 | k == 0 || k == n = 1
 | otherwise        = binomGuard (n-1) (k-1) + binomGuard (n-1) k
