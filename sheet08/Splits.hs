module Splits where
    -- Creates a list containing all splits of a given list.
    -- A split is a tuple of two list that add up to the whole list when
    -- conatenated. 
    splits :: [t] -> [([t], [t])]
    splits list = [(take n list, drop n list) | n <- [0..length list]]
