module Ropes (Rope (..), ropeLength, ropeConcat, toList, ropeSplitAt, ropeInsert, ropeDelete) where
    data Rope a
        = Leaf [a] -- a fraction of the actual elements of the rope
        | Inner (Rope a) Int (Rope a) -- inner node, containing two children and a *weight*, the length

    -- calculates the total amount of elements
    ropeLength :: Rope a -> Int
    ropeLength (Leaf list) = length list
    ropeLength (Inner _ leftLen right) = leftLen + ropeLength right

    -- concatenates two ropes
    ropeConcat :: Rope a -> Rope a -> Rope a
    ropeConcat ropeA = Inner ropeA (ropeLength ropeA)

    -- combines the elements of the rope to a signle list
    toList :: Rope a -> [a]
    toList (Leaf list) = list
    toList (Inner left _ right) = toList left ++ toList right

    -- splits a rope at a given index
    ropeSplitAt :: Int -> Rope a -> (Rope a, Rope a)
    ropeSplitAt i (Leaf list)                   = (Leaf (take i list), Leaf (drop i list))
    ropeSplitAt i (Inner left leftLen right)
        | leftLen < i   = let (l,r) = ropeSplitAt (i - leftLen) right
            in (Inner left leftLen l, r)
        | leftLen >= i  = let (l,r) = ropeSplitAt i left
            in (l, Inner r (ropeLength r) right)

    -- ropeInsert i a b inserts rope a into rope b at a index i
    ropeInsert :: Int -> Rope a -> Rope a -> Rope a
    ropeInsert i a b = Inner bl i (Inner a (ropeLength a) br)
        where (bl, br) = ropeSplitAt i b

    -- ropeDelete i j rope removes the i-th - (j-1)-th element from rope
    ropeDelete :: Int -> Int -> Rope a -> Rope a
    ropeDelete i j rope = ropeConcat beforeI fromJ where
        (beforeJ, fromJ) = ropeSplitAt j rope
        (beforeI, fromItoJ) = ropeSplitAt i beforeJ
