{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
-- improve church pair readability
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Use const" #-}

module ChurchPair (cPair) where
    import ChurchNumbers (Church, int2church)

    -- A church pair is a tuple in the lambda calculus
    type ChurchPair a b c = (a -> b -> c) -> c 

    -- Constructs a church pair from two given vales
    cPair :: a -> b -> ChurchPair a b c
    cPair a b = \f -> f a b
