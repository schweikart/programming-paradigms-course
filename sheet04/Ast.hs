module Ast (Exp (..)) where
    data Exp t =            -- t is value type of expression
        Var t |             -- var specified through t, as requested by exercise 
        Const t |           -- constant value
        Sum (Exp t) (Exp t) -- sum of two expressions
