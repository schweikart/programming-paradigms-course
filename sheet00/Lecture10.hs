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

-- integer faculty computation using a naive recursion
-- this will take up O(n) computational space when evaluating it!
facultyNaive 1 = 1
facultyNaive n = n * facultyNaive (n-1)

-- integer faculty computation using tail recursion with an accumulator
-- this will take up O(1) computational space when evaluating it!
facultyAccumulator n = facAcc n 1 where
    facAcc 1 acc = acc
    facAcc n acc = facAcc (n - 1) (n * acc)

-- n-th fibonacci number computation using a naive recursive approach
-- this will take O(2^n) time when evaluating it!
fibonacciNaive 0 = 0
fibonacciNaive 1 = 1
fibonacciNaive n = fibonacciNaive (n-1) + fibonacciNaive (n-2)

-- n-th fibonacci number computation using an accumulator
-- this will take O(n) time when evaluating it!
fibonacciAccumulator n = fibAcc n 0 1 where
    fibAcc 0 n1 _  = n1
    fibAcc 1 _  n2 = n2
    fibAcc n n1 n2 = fibAcc (n-1) n2 (n1 + n2)

-- counts the length of a list, re-implementation of the prelude length function
myLength list = if null list then 0 else 1 + length (tail list)

-- Checks if an item is contained in a list at least once
myElem item list = not (null list) && (head list == item || myElem item (tail list))

-- finds the maximum of a non-empty list
myMaxmimum list
  | null list           = error "empty!"
  | null (tail list)    = head list
  | otherwise           = max (head list) (myMaxmimum (tail list))