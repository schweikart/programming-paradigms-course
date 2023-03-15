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
            Nothing -> []
            Just (Leaf, rest) -> go rest
            Just (Node left x right, rest) -> x : go (enqueue right (enqueue left rest))
