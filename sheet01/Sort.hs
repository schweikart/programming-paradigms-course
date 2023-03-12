module Sort where
    -- Task 2.1: insert a number into a list sorted in ascending order
    insert number []        = [number]
    insert number (p:ps)
        | number <  p   = number:p:ps
        | number >= p   = p:insert number ps

    -- Task 2.2: sort a given list using the insertion sort algorithm
    insertSort ps = foldr insert [] ps