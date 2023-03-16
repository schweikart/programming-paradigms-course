{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
-- improve church pair readability
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Use const" #-}

module ChurchPair (cPair, cFst, cSnd, cNext, cPred) where
    import ChurchNumbers (Church, int2church, cSucc)

    -- A church pair is a tuple in the lambda calculus
    type ChurchPair a b c = (a -> b -> c) -> c

    -- Constructs a church pair from two given vales
    cPair :: a -> b -> ChurchPair a b c
    cPair a b = \f -> f a b

    -- fst function for church pairs
    cFst :: ChurchPair a b a -> a
    cFst p = p (\a b -> a)

    -- snd function for church pairs
    cSnd :: ChurchPair a b b -> b
    cSnd p = p (\a b -> b)

    -- for a given church pair of church numbers (n, m), this function
    -- returns (m, m+1), another church pair of church numbers
    cNext :: ChurchPair a (Church t) (Church t) -> ChurchPair (Church t) (Church t) c
    cNext p = cPair m (cSucc m) where
        m = cSnd p

    cPred = \n -> cFst (n cNext (cPair (int2church 0) (int2church 0)))
