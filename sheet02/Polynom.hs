module Polynom where
    type Polynom = [Double]

    cmult :: Double -> Polynom -> Polynom
    cmult 0 p = [] -- representation length changes when multiplying with zero
    cmult c p = map (*c) p
