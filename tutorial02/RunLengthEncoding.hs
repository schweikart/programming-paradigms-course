module RunLengthEncoding where
    splitWhen :: (t -> Bool) -> [t] -> ([t], [t])
    splitWhen p xs = (takeWhile (not . p) xs, dropWhile (not . p) xs)
