module Ropes (Rope (..), ropeLength, ropeConcat, toList) where
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
