module Polynom where
    type Polynom = [Double]

    -- Task 2.1: Multiply a polynomial with a constant
    cmult :: Polynom -> Double -> Polynom
    cmult p 0 = [] -- representation length changes when multiplying with zero
    cmult p c = map (*c) p

    -- Task 2.2: Evaluate a polynomial for a given parameter x
    eval :: Polynom -> Double -> Double
    eval p x = foldr (\a acc -> a + x * acc) 0 p
