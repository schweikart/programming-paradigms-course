module TestArithmetik where
    import TestUtils (testEq)
    import Arithmetik (pow1)
    
    pow1Tests = [
            testEq "pow1 2 10 == 1024" 1024 (pow1 2 10),
            testEq "pow1 10 10 == 10000000000" 10000000000 (pow1 10 10),
            testEq "pow1 99999 0 == 1" 1 (pow1 99999 0)
        ]