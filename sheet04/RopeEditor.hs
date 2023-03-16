import Control.Monad (forever)
import Ropes (Rope (Leaf), ropeInsert, ropeDelete, toList)

main :: IO ()
main = loop (Leaf [])

-- read input, handle command, print output, repeat
loop :: Rope String -> IO ()
loop document = do
    line <- getLine
    let newDocument = runCommand document line
    printDocument newDocument
    loop newDocument

-- parses a line numer string (1-based) into a line index (0-based)
parseLineIndex :: String -> Int
parseLineIndex lineNumberString = read lineNumberString - 1

-- finds out which command provided and delegates its execution to the corresponding command handler function
runCommand :: Rope String -> String -> Rope String
runCommand document ('i':' ':rest) = inputCommand document rest
runCommand document ('d':' ':rest) = deleteCommand document rest
runCommand document ('c':' ':rest) = replaceCommand document rest
runCommand document _ = document

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
replaceCommand document startStopAndText = ropeInsert start (Leaf [text]) $ ropeDelete start stop document
    where
        [startString, stopString, text] = words startStopAndText
        start = parseLineIndex startString
        stop = parseLineIndex stopString

-- prints the whole document to stdout
printDocument :: Rope String -> IO ()
printDocument document = putStrLn $ unlines $ toList document
