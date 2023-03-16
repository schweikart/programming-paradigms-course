module Sprite (Sprite(..), Color(..), isActiveAt, translate, eval, replaceColor, render) where
    -- A (Sprite f x_min x_max y_min y_max) is a rasterized image described
    -- through a pixel map f.
    data Sprite = Sprite (Int -> Int -> Color) Int Int Int Int

    -- For this exercise, we assume a simple color palette consisting of four
    -- colors and transparency.
    data Color = Red | Green | Blue | Black | None
        deriving (Eq, Show)

    -- A sprite is only active within its defined boundaries.
    isActiveAt :: Int -> Int -> Sprite -> Bool
    isActiveAt x y (Sprite _ xmin xmax ymin ymax) =
        xmin <= x && x <= xmax &&
        ymin <= y && y <= ymax

    -- Translates a given sprite by a given dx and dy coordinate
    translate :: Int -> Int -> Sprite -> Sprite
    translate dx dy (Sprite f xmin xmax ymin ymax) = Sprite f' xmin' xmax' ymin' ymax' where
        f' x y = f (x - dx) (y - dy)
        xmin' = xmin + dx
        xmax' = xmax + dx
        ymin' = ymin + dy
        ymax' = ymax + dy
    

    -- Finds the color of the given sprite at the given coordinates.
    -- Doesn't check whether the sprite is active.
    eval :: Sprite -> Int -> Int -> Color
    eval (Sprite f _ _ _ _) = f

    -- replaceColor sprite c1 c2 returns a copy of sprite where all occurrences
    -- of the color c1 were replaced with color c2 
    replaceColor :: Sprite -> Color -> Color -> Sprite
    replaceColor (Sprite f xmin xmax ymin ymax) c1 c2 = Sprite f' xmin xmax ymin ymax
        where f' x y = let orig = f x y in if orig == c1 then c2 else orig

    -- Renders a sprite onto a canvas of the given size (width, height) with the
    -- given background color.
    -- The resulting color array is a list of lines.
    render :: Int -> Int -> Color -> Sprite -> [[Color]]
    render width height background sprite = [
                [renderPixel x y | x <- [0..(width-1)]]
            | y <- [0..(height-1)]]
        where renderPixel x y = let orig = eval sprite x y in if orig == None then background else orig
    