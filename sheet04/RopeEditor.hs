module RopeEditor (runCommand) where
    import Ropes (Rope (Leaf), ropeInsert, ropeDelete, toList)

    -- parses a line numer string (1-based) into a line index (0-based)
    parseLineIndex :: String -> Int
    parseLineIndex lineNumberString = read lineNumberString - 1

    -- finds out which command provided and delegates its execution to the corresponding command handler function
    runCommand :: [Rope String] -> String -> [Rope String]
    runCommand documentHistory ('i':' ':rest)   = inputCommand (head documentHistory) rest : documentHistory
    runCommand documentHistory ('d':' ':rest)   = deleteCommand (head documentHistory) rest : documentHistory
    runCommand documentHistory ('c':' ':rest)   = replaceCommand (head documentHistory) rest : documentHistory
    runCommand documentHistory ('u':rest)       = undoCommand documentHistory
    runCommand documentHistory _ = documentHistory

    -- handles the "i line text" command which inserts a line of the given text at line (1-based)
    inputCommand :: Rope String -> String -> Rope String
    inputCommand document lineAndText = ropeInsert (parseLineIndex lineString) (Leaf [text]) document
        where [lineString, text] = words lineAndText

    -- handles the "d start stop" command which deletes lines start (1-based) to stop (1-based)
    deleteCommand :: Rope String -> String -> Rope String
    -- adding 1 to stop string as the commands stop parameter is inclusive and the function parameter is exclusive
    deleteCommand document startAndStop = ropeDelete (parseLineIndex startString) (parseLineIndex stopString + 1) document
        where [startString, stopString] = words startAndStop

    -- handles the "c start stop text" command which replaces lines start (1-based) to stop (1-based) with a line of the given text
    replaceCommand :: Rope String -> String -> Rope String
    -- adding 1 to stop string as the commands stop parameter is inclusive and the function parameter is exclusive
    replaceCommand document startStopAndText = ropeInsert start (Leaf [text]) $ ropeDelete start (stop + 1) document
        where
            [startString, stopString, text] = words startStopAndText
            start = parseLineIndex startString
            stop = parseLineIndex stopString

    -- handles the "u" command which undoes the last command (if there was a last command)
    undoCommand :: [Rope String] -> [Rope String]
    undoCommand documentHistory@[onlyState] = documentHistory
    undoCommand documentHistory = tail documentHistory
