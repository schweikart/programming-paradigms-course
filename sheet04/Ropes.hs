module Ropes where
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
