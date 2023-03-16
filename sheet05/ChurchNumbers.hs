{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
module ChurchNumbers (Church, int2church, church2int) where
    -- Church numbers represent natural numbers as functions in the lambda
    -- calculus.
    type Church t = (t -> t) -> t -> t

    -- converts an integer to a church number
    int2church :: Integer -> Church t
    int2church i
        | i == 0    = \s n -> n
        | i < 0     = error "cannot represent negative numbers as church numbers"
        | i > 0     = \s n -> s (int2church (i-1) s n) 

    -- converts a church number to an integer
    church2int :: Church Integer -> Integer
    church2int iChurch = iChurch (+1) 0
