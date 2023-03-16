module TestSprite where
    import Sprite (Sprite (Sprite), Color (Black, Blue, None, Red), isActiveAt, translate, eval, replaceColor)
    import TestUtils (testBool, testEq)

    testSprite :: Sprite
    testSprite = Sprite f (-3) 2 5 9
        where f x y = if even (x + y) then Blue else Black
    
    onePixelSprite :: Sprite
    onePixelSprite = Sprite f 0 0 0 0 where
        f 0 0 = Black
        f x y = None
    
    getMap (Sprite map _ _ _ _) = map
    getXmin (Sprite _ xmin _ _ _) = xmin
    getXmax (Sprite _ _ xmax _ _) = xmax
    getYmin (Sprite _ _ _ ymin _) = ymin
    getYmax (Sprite _ _ _ _ ymax) = ymax

    
    isActiveAtTests = [
            testBool "testSprite is inactive at (0,0)" $ not $ isActiveAt 0 0 testSprite,
            testBool "testSprite is active at (0,7)" $ isActiveAt 0 7 testSprite,
            testBool "testSprite is inactive at (-4,7)" $ not $ isActiveAt (-4) 7 testSprite,
            testBool "testSprite is inactive at (3,7)" $ not $ isActiveAt 3 7 testSprite,
            testBool "testSprite is inactive at (10,10)" $ not $ isActiveAt 10 10 testSprite
        ]
    
    translateTests = [
            testEq "getXmin (translate 10 20 onePixelSprite) == 10" 10 $ getXmin $ translate 10 20 onePixelSprite,
            testEq "getXmax (translate 10 20 onePixelSprite) == 10" 10 $ getXmax $ translate 10 20 onePixelSprite,
            testEq "getYmin (translate 10 20 onePixelSprite) == 20" 20 $ getYmin $ translate 10 20 onePixelSprite,
            testEq "getYmax (translate 10 20 onePixelSprite) == 20" 20 $ getYmax $ translate 10 20 onePixelSprite,
            testEq "getMap (translate 10 20 onePixelSprite) 0 0 == None" None $ getMap (translate 10 20 onePixelSprite) 0 0,
            testEq "getMap (translate 10 20 onePixelSprite) 10 20 == Black" Black $ getMap (translate 10 20 onePixelSprite) 10 20
        ]
    
    evalTests = [
            testEq "onePixelSprite is black at (0,0)" Black $ eval onePixelSprite 0 0,
            testEq "onePixelSprite is none at (0,-1)" None $ eval onePixelSprite 0 (-1),
            testEq "onePixelSprite is none at (0,1)" None $ eval onePixelSprite 0 1,
            testEq "onePixelSprite is none at (-1,0)" None $ eval onePixelSprite (-1) 0,
            testEq "onePixelSprite is none at (1,0)" None $ eval onePixelSprite 1 0
        ]
    
    replaceColorTests = [
            testEq "test replacing occurring color" Blue $ eval (replaceColor onePixelSprite Black Blue) 0 0,
            testEq "test replacing non-occurring color" Black $ eval (replaceColor onePixelSprite Red Blue) 0 0
        ]

    spriteTestCases = isActiveAtTests ++ translateTests ++ evalTests ++ replaceColorTests
