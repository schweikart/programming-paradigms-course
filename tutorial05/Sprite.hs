module Sprite (Sprite(..), Color(..), isActiveAt, translate) where
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
