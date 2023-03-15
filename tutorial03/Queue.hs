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

    -- Adds an element to the back of the queue
    -- space complexity: O(1)
    enqueue :: a -> Queue a -> Queue a
    enqueue el (Q front back) = Q front (el:back)

    -- Removes an element from the front of the queue, if possible
    -- space complexity: O(?)
    dequeue :: Queue a -> Maybe (a, Queue a)
    dequeue (Q [] []) = Nothing
    dequeue (Q (f:fs) back) = Just (f, Q fs back)
    dequeue (Q [] back) = dequeue (Q (reverse back) [])
