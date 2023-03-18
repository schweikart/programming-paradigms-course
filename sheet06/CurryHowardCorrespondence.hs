 -- for the declaration of False
{-# LANGUAGE EmptyDataDecls #-}

 -- for better readability of strange type logic terms
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Avoid lambda" #-}

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

    -- The mere fact that this function compiles (and is well-defined) proves
    -- that "A and B" implies "B and A" for any logic formulae "A" and "B".
    commutativeAnd :: And a b -> And b a
    commutativeAnd (AndI a b) = AndI b a

    -- Similarly, the following function proves that
    -- "(A or B) and C" implies "(A and C) or (B and C)"
    distributiveOrAnd :: And (Or a b) c -> Or (And a c) (And b c)
    distributiveOrAnd (AndI (OrI1 a) c) = OrI1 (AndI a c)
    distributiveOrAnd (AndI (OrI2 b) c) = OrI2 (AndI b c)

    -- Define False as an unconstructable data type (allowed through language
    -- extension).
    data False

    -- Define "Not a" as a function that maps to False if a type 
    type Not a = a -> False

    -- You know the drill:
    -- The compilability of the following formula proves that
    -- "A" implies "not not A"
    notNot :: a -> Not (Not a)
    --     :: a -> Not a -> False
    --     :: a -> (a -> False) -> False
    notNot a notA = notA a

    -- prove "not (A and not A)"
    noContradiction :: Not (And a (Not a))
    --              :: (And a (Not a)) -> False
    --              :: (And a (a -> False)) -> False
    noContradiction contradiction = andE2 contradiction $ -- andE2 = not a = \a -> False
                                    andE1 contradiction   -- andE1 = a

    -- prove one direction in one of of de Morgans laws:
    -- "not A or not B" implies "not (A and B)"
    deMorgan :: Or (Not a) (Not b) -> Not (And a b)
    deMorgan (OrI1 notA) = \aAndB -> notA (andE1 aAndB)
    deMorgen (OrI2 notB) = \aAndB -> notB (andE2 aAndB)

    -- "Tertium non datur" (the law of excluded middle) cannot be derived so we
    -- just write it down as an axiom.
    tertiumNonDatur :: Or a (Not a)
    tertiumNonDatur = undefined

    -- Prove other direction in one of de Morgans laws:
    -- "not (A and B)" implies "not A or not B"
    nagromEd :: Not (And a b) -> Or (Not a) (Not b)
    nagromEd notAAndB = case tertiumNonDatur of -- cases for if a is true or false
        -- case 1: A is false -> or statement of "not A" and anything is true
        OrI2 notA   -> OrI1 notA
        -- case 2: A is true -> notAAndB implies that B must be false
        -- here, notAAndB (AndI a b) would be false is b is true,
        -- so "b -> notAAndB (AndI a b)" would be "not B"
        OrI1 a      -> OrI2 (\b -> notAAndB (AndI a b))
