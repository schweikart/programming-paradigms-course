module CurryHowardCorrespondence where
    -- Data type capturing a logical "and" combination of two data types.
    -- Could also be expressed as a tuple.
    data And a b = AndI a b

    andE1 :: And a b -> a
    andE1 (AndI a _) = a

    andE2 :: And a b -> b
    andE2 (AndI _ b) = b

    -- Data type capturing a logical "or" combination of two data types.
    -- You can always specify both data types (as there are two type parameters)
    -- but one of the parameters can be "omitted" by passing any type for the
    -- unused type parameter.
    -- Could also be expressed through "Either".
    data Or a b =
        OrI1 a |
        OrI2 b
    

    -- needs two translator functions to create a common output type
    orE :: Or a b -> (a -> w) -> (b -> w) -> w
    orE (OrI1 a) ta _ = ta a
    orE (OrI2 b) _ tb = tb b
