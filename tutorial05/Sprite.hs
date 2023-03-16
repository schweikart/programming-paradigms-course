module Sprite where
    -- A (Sprite f x_min x_max y_min y_max) is a rasterized image described
    -- through a pixel map f.
    data Sprite = Sprite (Int -> Int -> Color) Int Int Int Int

    -- For this exercise, we assume a simple color palette consisting of four
    -- colors and transparency.
    data Color = Red | Green | Blue | Black | None

    -- A sprite is only active within its defined boundaries.
    isActiveAt :: Int -> Int -> Sprite -> Bool
    isActiveAt x y (Sprite _ xmin xmax ymin ymax) =
        xmin <= x && x <= xmax &&
        ymin <= y && y <= ymax