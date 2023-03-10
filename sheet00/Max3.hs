module Max3 where
    max3if x y z =
        if x >= y && x >= z
        then x
        else if y >= x && y >= z
        then y
        else z
    
    max3guard x y z
        | x >= y && x >= z  = x
        | y >= x && y >= z  = y
        | otherwise         = z
    
    max3max x y z = max (max x y) z
