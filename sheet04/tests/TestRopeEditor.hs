module TestRopeEditor where
    import Ropes (Rope(Leaf), toList)
    import RopeEditor (runCommand)
    import TestUtils (testEq)
    
    commands = [
            "i 1 hello",
            "i 2 world",
            "i 2 cruel",
            "c 1 2 goodbye",
            "u",
            "u",
            "u",
            "u"
        ]
    
    expectedDocumentsContents = [
            [],
            ["hello"],
            ["hello", "world"],
            ["hello", "cruel", "world"],
            ["goodbye", "world"],
            ["hello", "cruel", "world"],
            ["hello", "world"],
            ["hello"],
            []
        ]
    
    documentContentsAfterNthCommand n = toList $ head $ foldl runCommand [Leaf []] (take n commands)
    
    ropeEditorTestCases = [
                testEq
                    (show i ++ "-th command in test flow")
                    (expectedDocumentsContents !! i)
                    (documentContentsAfterNthCommand i)
            | i <- [0..8] ]
