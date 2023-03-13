module Polynom where
    type Polynom = [Double]

    -- Task 2.1: Multiply a polynomial with a constant
    cmult :: Polynom -> Double -> Polynom
    cmult p 0 = [] -- representation length changes when multiplying with zero
    cmult p c = map (*c) p
