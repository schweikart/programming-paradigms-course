{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant lambda" #-} -- makes church lists more readable

module Church where
    -- Church lists are an abstract way of representing lists through functions
    -- in the lambda calculus.
    type ChurchList t u = (t -> u -> u) -> u -> u

    -- Converts a Church list to a Haskell list.
    church2list :: ChurchList t [t] -> [t]
    church2list cl = cl (:) []

    -- Converts a Haskell list to a Church list
    list2church :: [t] -> ChurchList t u
    list2church xs = \c n -> foldr c n xs
