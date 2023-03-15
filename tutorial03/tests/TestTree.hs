module TestTree where
    import Tree (bfs, Tree (Leaf, Node))
    import TestUtils (testEq)

    treeTestCases = [
            testEq "bfs on empty tree" ([] :: [Int]) $ bfs Leaf,
            testEq "bfs on trivial tree" [1] $ bfs (Node Leaf 1 Leaf),
            testEq "bfs on level 1 tree" [1,2,3] $ bfs (Node (Node Leaf 2 Leaf) 1 (Node Leaf 3 Leaf)),
            testEq "bfs on level 2 balanced tree" [1..7] $ bfs (Node
                (Node
                    (Node
                        Leaf
                        4
                        Leaf
                    )
                    2
                    (Node
                        Leaf
                        5
                        Leaf
                    )
                )
                1
                (Node
                    (Node
                        Leaf
                        6
                        Leaf
                    )
                    3
                    (Node
                        Leaf
                        7
                        Leaf
                    )
                )
            )
        ]
