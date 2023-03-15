module Ast (Exp (..), Env, eval) where
    -- simple integer adding expression
    data Exp t =            -- t is the type containing all variables
        Var t |             -- variable from the given type
        Const Integer |     -- Integer = constant value
        Sum (Exp t) (Exp t) -- with summand expressions

    -- variable environment assigning a value to each variable
    type Env t = t -> Integer

    -- evaluates a given expression with a given variable assignment
    eval :: Env t -> Exp t -> Integer
    eval env (Var t) = env t
    eval env (Const t) = t
    eval env (Sum t1 t2) = eval env t1 + eval env t2
