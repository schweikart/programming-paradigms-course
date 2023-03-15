module Queue (Queue (Q), fromList, toList) where
    -- A queue "Q front back" represents data of the form
    -- "from ++ reverse back".
    data Queue a = Q [a] [a]
        deriving Show
    
    -- Create a queue from a given list
    fromList :: [a] -> Queue a
    fromList list = Q list []

    -- Read out the data list from a given queue
    toList :: Queue a -> [a]
    toList (Q front back) = front ++ reverse back
