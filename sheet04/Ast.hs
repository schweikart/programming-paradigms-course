module Ast (Exp (..), Env, eval) where
    -- simple integer adding expression
    data Exp t =                    -- t is the type containing all variables
        Var t |                     -- variable from the given type
        Const Integer |             -- Integer = constant value
        Sum (Exp t) (Exp t) |       -- with summand expressions
        Less (Exp t) (Exp t) |      -- a < b is 1 iff a is evaluated to less than b, otherwise 1
        And (Exp t) (Exp t) |       -- a and b is 1 iff a and b are evaluated to something other than 0, otherwise 0
        Not (Exp t) |               -- not a is 1 iff a is 0, otherwise 1
        If (Exp t) (Exp t) (Exp t)  -- if _ then _ else _ operator

    -- variable environment assigning a value to each variable
    type Env t = t -> Integer

    -- evaluates a given expression with a given variable assignment
    eval :: Env t -> Exp t -> Integer
    eval env (Var t)        = env t
    eval env (Const t)      = t
    eval env (Sum t1 t2)    = eval env t1 + eval env t2
    eval env (Less t1 t2)   = if eval env t1 < eval env t2 then 1 else 0
    eval env (And t1 t2)    = if trueish (eval env t1) && trueish (eval env t2) then 1 else 0
    eval env (Not t)        = if trueish (eval env t) then 0 else 1
    eval env (If b t e)     = eval env (if trueish (eval env b) then t else e) 

    -- checks if an integer is true-ish, i.e., it is something other than zero 
    trueish :: Integer -> Bool
    trueish = (/= 0)

    instance Show t => Show (Exp t) where
        show (Var t) = show t
        show (Const c) = show c
        show (Sum t1 t2) = "(" ++ show t1 ++ " + " ++ show t2 ++ ")"
        show (Less t1 t2)   = "(" ++ show t1 ++ " < " ++ show t2 ++ ")"
        show (And t1 t2)    = "(" ++ show t1 ++ " && " ++ show t2 ++ ")"
        show (Not t)        = "!" ++ show t
        show (If b t e)     = "(if " ++ show b ++ " then " ++ show t ++ " else " ++ show e ++ ")"
