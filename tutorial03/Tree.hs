module Tree (Tree (Leaf, Node), bfs) where
    import Queue ( Queue(..), fromList, enqueue, dequeue )

    -- A simple binary tree data type.
    -- Only nodes contain data, leafs cannot.
    data Tree t =
        Leaf |
        Node (Tree t) t (Tree t)
    
    -- breadth-first-search on a tree
    bfs :: Tree a -> [a]
    bfs tree = go (fromList [tree]) where
        go :: Queue (Tree a) -> [a]
        go queue = case dequeue queue of
            Nothing         -> []
            Just (t, rest)  -> treeContent t ++ go (enqueueChildren rest t)
        
        treeContent :: Tree t -> [t]
        treeContent tree = case tree of
            Leaf        -> []
            Node _ e _  -> [e]

        enqueueChildren :: Queue (Tree t) -> Tree t -> Queue (Tree t)
        enqueueChildren queue tree = case tree of
            Leaf                -> queue
            Node left e right   -> enqueue right (enqueue left queue)
