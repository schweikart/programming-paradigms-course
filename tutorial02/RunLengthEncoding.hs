module RunLengthEncoding where
    -- splits a liste before the first occurrence of the predicate coming true
    splitWhen :: (t -> Bool) -> [t] -> ([t], [t])
    splitWhen p xs = (takeWhile (not . p) xs, dropWhile (not . p) xs)

    -- splits a list into lists that only contain the same element
    group :: Eq t => [t] -> [[t]]
    group [] = []
    group list@(x:xs) = nextGroup : group rest where
        (nextGroup, rest) = splitWhen (/= x) list
