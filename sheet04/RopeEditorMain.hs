import Ropes (Rope (Leaf), toList)
import RopeEditor (runCommand)
    
-- starts the rope edior
main :: IO ()
main = loop [Leaf []]

-- simple text editor using a REPL environment
loop :: [Rope String] -> IO ()
loop documentHistory = do
    line <- getLine
    let newDocumentHistory = runCommand documentHistory line
    printDocument $ head newDocumentHistory
    loop newDocumentHistory

-- prints the whole document to stdout
printDocument :: Rope String -> IO ()
printDocument document = putStrLn $ unlines $ toList document
