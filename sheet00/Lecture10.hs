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
