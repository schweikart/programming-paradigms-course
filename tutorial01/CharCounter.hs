module CharCounter (countChar, countCharAcc) where
    -- call "indicator c" for the indicator function delta_c
    indicator :: Eq a => a -> a -> Int
    indicator target x = if x == target then 1 else 0

    -- counts the amount of occurrences of a given character in a given string
    -- (non-tail-recursive implementation)
    countChar :: Char -> String -> Int
    countChar c [] = 0
    countChar c (x:xs) = indicator c x + countChar c xs

    -- counts the amount of occurrences of a given character in a given string
    -- (tail-recursive implementation) 
    countCharAcc :: Char -> String -> Int
    countCharAcc c string = ccAcc string 0 where
        ccAcc [] acc = acc
        ccAcc (x:xs) acc = ccAcc xs (acc + indicator c x) 
