module TestAst where
    import Ast (Env, eval, Exp (Sum, Var, Const))
    import TestUtils (testEq)
    
    a1b2c3 :: Env Char
    a1b2c3 'a' = 1
    a1b2c3 'b' = 2
    a1b2c3 'c' = 3

    evalTests = [
            testEq "a == 1 with a=1,b=2,c=3" 1 $ eval a1b2c3 (Var 'a'),
            testEq "7 == 7 with a=1,b=2,c=3" 7 $ eval a1b2c3 (Const 7),
            testEq "a + 7 == 8 with a=1,b=2,c=3" 8 $ eval a1b2c3 (Sum (Var 'a') (Const 7)),
            testEq "a + b + c == 6 with a=1,b=2,c=3" 6 $ eval a1b2c3 (Sum (Var 'a') (Sum (Var 'b') (Var 'c'))),
            testEq "a + 10 + c == 6 with a=1,b=2,c=3" 6 $ eval a1b2c3 (Sum (Var 'a') (Sum (Const 10) (Var 'c')))
        ]

    astTestCases = evalTests
