module TestAst where
    import Ast (Env, eval, Exp (Sum, Var, Const, Less, And, Not))
    import TestUtils (testEq)

    a1b2c3 :: Env Char
    a1b2c3 'a' = 1
    a1b2c3 'b' = 2
    a1b2c3 'c' = 3

    evalTests = [
            -- var
            testEq "a == 1 with a=1,b=2,c=3" 1 $ eval a1b2c3 (Var 'a'),

            -- const
            testEq "7 == 7 with a=1,b=2,c=3" 7 $ eval a1b2c3 (Const 7),

            -- sum
            testEq "a + 7 == 8 with a=1,b=2,c=3" 8 $ eval a1b2c3 (Sum (Var 'a') (Const 7)),

            -- less
            testEq "6 < 9 with a=1,b=2,c=3" 1 $ eval a1b2c3 (Less (Const 6) (Const 9)),
            testEq "9 < 6 with a=1,b=2,c=3" 0 $ eval a1b2c3 (Less (Const 9) (Const 6)),
            testEq "6 < 6 with a=1,b=2,c=3" 0 $ eval a1b2c3 (Less (Const 6) (Const 6)),

            -- and
            testEq "0 and 0 with a=1,b=2,c=3" 0 $ eval a1b2c3 (And (Const 0) (Const 0)),
            testEq "0 and 1 with a=1,b=2,c=3" 0 $ eval a1b2c3 (And (Const 0) (Const 1)),
            testEq "1 and 0 with a=1,b=2,c=3" 0 $ eval a1b2c3 (And (Const 1) (Const 0)),
            testEq "1 and 1 with a=1,b=2,c=3" 1 $ eval a1b2c3 (And (Const 1) (Const 1)),

            -- not
            testEq "not 0 with a=1,b=2,c=3" 1 $ eval a1b2c3 (Not (Const 0)),
            testEq "not 1 with a=1,b=2,c=3" 0 $ eval a1b2c3 (Not (Const 1)),
            testEq "not 2 with a=1,b=2,c=3" 0 $ eval a1b2c3 (Not (Const 2)),

            -- combinations
            testEq "a + b + c == 6 with a=1,b=2,c=3" 6 $ eval a1b2c3 (Sum (Var 'a') (Sum (Var 'b') (Var 'c'))),
            testEq "a + 10 + c == 14 with a=1,b=2,c=3" 14 $ eval a1b2c3 (Sum (Var 'a') (Sum (Const 10) (Var 'c'))),
            testEq "(a < (a + 10)) and (not b) == 6 with a=1,b=2,c=3" 0 $ eval a1b2c3 (And (Less (Var 'a') (Sum (Var 'a') (Const 10))) (Not (Var 'b')))
        ]

    showTests = [
            -- var
            testEq "show for a" "'a'" $ show (Var 'a'),

            -- const
            testEq "show for 7" "7" $ show (Const 7 :: Exp Int),

            -- sum
            testEq "show for a + 7" "('a' + 7)" $ show (Sum (Var 'a') (Const 7)),

            -- less
            testEq "show for 6 < 9" "(6 < 9)" $ show (Less (Const 6) (Const 9) :: Exp Int),
            testEq "show for 9 < 6" "(9 < 6)" $ show (Less (Const 9) (Const 6) :: Exp Int),
            testEq "show for 6 < 6" "(6 < 6)" $ show (Less (Const 6) (Const 6) :: Exp Int),

            -- and
            testEq "show 0 and 0" "(0 && 0)" $ show (And (Const 0) (Const 0) :: Exp Int),
            testEq "show 0 and 1" "(0 && 1)" $ show (And (Const 0) (Const 1) :: Exp Int),
            testEq "show 1 and 0" "(1 && 0)" $ show (And (Const 1) (Const 0) :: Exp Int),
            testEq "show 1 and 1" "(1 && 1)" $ show (And (Const 1) (Const 1) :: Exp Int),

            -- not
            testEq "show not 0" 1 $ eval a1b2c3 (Not (Const 0)),
            testEq "show not 1" 0 $ eval a1b2c3 (Not (Const 1)),
            testEq "show not 2" 0 $ eval a1b2c3 (Not (Const 2)),

            -- combinations
            testEq "show a + b + c" "('a' + ('b' + 'c'))" $ show (Sum (Var 'a') (Sum (Var 'b') (Var 'c'))),
            testEq "show a + 10 + c" "('a' + (10 + 'c'))" $ show (Sum (Var 'a') (Sum (Const 10) (Var 'c'))),
            testEq "show (a < (a + 10)) and (not b)" "(('a' < ('a' + 10)) && !'b')" $ show (And (Less (Var 'a') (Sum (Var 'a') (Const 10))) (Not (Var 'b')))
        ]

    astTestCases = evalTests ++ showTests
