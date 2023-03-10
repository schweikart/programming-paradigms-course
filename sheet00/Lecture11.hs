module Lecture11 where
    myMap :: (s -> t) -> [s] -> [t]
    myMap f []        = []
    myMap f (x:xs)    = (f x):(myMap f xs)

    myFilter :: (t -> Bool) -> [t] -> [t]
    myFilter pred []      = []
    myFilter pred (x:xs)  =
        if pred x
        then x:myFilter pred xs
        else myFilter pred xs

    comp :: (u -> t) -> (s -> u) -> (s -> t)
    comp f g x = f (g x)

    iter :: (t -> t) -> Integer -> (t -> t)
    iter f n x = iter f (n-1) (f x)

    sumNaive :: [Integer] -> Integer
    sumNaive []        = 0
    sumNaive (x:xs)    = x + sumNaive xs

    sumFoldr :: [Integer] -> Integer
    sumFoldr = foldr (+) 0

    sumFoldl :: [Integer] -> Integer
    sumFoldl = foldl (+) 0
    
    -- concat
    flatten :: [[t]] -> [t]
    flatten = foldr (++) []

    myZipWith :: (s -> t -> u) -> [s] -> [t] -> [u]
    myZipWith f (x:xs) (y:ys)   = f x y : myZipWith f xs ys
    myZipWith f xs     ys       = [] -- one of xs, ys is empty

    skalar :: Num t => [t] -> [t] -> t
    skalar v1 v2 = sum (zipWith (*) v1 v2)

    -- re-implementation of zip
    myZip = zipWith (,)

    -- hamming-distance computation for two lists of the same length
    hamming :: Eq t => [t] -> [t] -> Integer
    hamming list1 list2 = sum (myZipWith differs list1 list2) where
        differs x y = if x == y then 0 else 1
