module Exam (results, average) where
    -- List of exam results
    results :: [(Int, Float)]
    results = [(15486, 1.3), (45678, 5.0), (35486, 2.7)]

    -- Computes the average of an exam results list
    average :: [(Int, Float)] -> Float
    average results = sum passedGrades / fromIntegral (length passedGrades) where
        passedGrades = filter (<= 4.0) $ map snd results
