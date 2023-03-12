module Sort where
    -- Task 2.1: insert a number into a list sorted in ascending order
    insert number []        = [number]
    insert number (p:ps)
        | number <  p   = number:p:ps
        | number >= p   = p:insert number ps

    -- Task 2.2: sort a given list using the insertion sort algorithm
    insertSort ps = foldr insert [] ps

    -- Task 2.3: merge two sorted integer lists
    merge (x:xs) (y:ys)
        | x < y         = x:merge xs (y:ys)
        | x >= y        = y:merge (x:xs) ys
    merge xs ys         = xs ++ ys -- one of them is empty

    -- Task 2.4: sort a given list using the merge sort algorithm
    mergeSort [] = []
    mergeSort [x] = [x]
    mergeSort list = merge (mergeSort (take half list)) (mergeSort (drop half list)) where
        half = length list `div` 2
