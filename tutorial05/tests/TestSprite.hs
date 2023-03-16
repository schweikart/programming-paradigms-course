module TestSprite where
    import Sprite (Sprite (Sprite), Color (Black, Blue), isActiveAt)
    import TestUtils (testBool)

    testSprite :: Sprite
    testSprite = Sprite f (-3) 2 5 9
        where f x y = if even (x + y) then Blue else Black
    
    isActiveAtTests = [
            testBool "testSprite is inactive at (0,0)" $ not $ isActiveAt 0 0 testSprite,
            testBool "testSprite is active at (0,7)" $ isActiveAt 0 7 testSprite,
            testBool "testSprite is inactive at (-4,7)" $ not $ isActiveAt (-4) 7 testSprite,
            testBool "testSprite is inactive at (3,7)" $ not $ isActiveAt 3 7 testSprite,
            testBool "testSprite is inactive at (10,10)" $ not $ isActiveAt 10 10 testSprite
        ]

    spriteTestCases = isActiveAtTests
