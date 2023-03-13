-- This script creates a new package for solving an excercise sheet.
-- I am aware that Haskell is not ideal for scripting but I wanted to use it for
-- this purpose anyways to practice using Haskell in other contexts. 

import System.Posix.Internals (newFilePath)
import System.Directory (doesDirectoryExist, createDirectory)

main :: IO ()
main = do
    putStrLn "Please enter the number of the sheet you want to create a package for:"
    sheetNumber <- getLine

    let sheetDirectoryPath = "./sheet" ++ sheetNumber
    sheetDirectoryExists <- doesDirectoryExist sheetDirectoryPath
    if sheetDirectoryExists
        then
            putStrLn "Sheet directory already exists!"
        else (do
            createDirectory sheetDirectoryPath

            let cabalFilePath = sheetDirectoryPath ++ "/sheet" ++ sheetNumber ++ ".cabal" 
            writeFile cabalFilePath $ cabalFileContents sheetNumber

            let mainFilePath = sheetDirectoryPath ++ "/Sheet" ++ sheetNumber ++ ".hs"
            writeFile mainFilePath $ mainFileContents sheetNumber

            let testDirectoryPath = sheetDirectoryPath ++ "/tests"
            createDirectory testDirectoryPath

            let testMainFilePath = testDirectoryPath ++ "/Tests.hs"
            writeFile testMainFilePath $ testMainFileContents sheetNumber

            let testSheetsFilePath = testDirectoryPath ++ "/TestSheet" ++ sheetNumber ++ ".hs"
            writeFile testSheetsFilePath $ testSheetFileContents sheetNumber

            putStrLn $ "Created package for sheet " ++ sheetNumber ++ "!"
        )

cabalFileContents :: String -> String
cabalFileContents sheetNumber = unlines [
        "cabal-version: 3.6",
        "name: sheet" ++ sheetNumber,
        "version: 1.0.0",
        "build-type: Simple",
        "",
        "Library",
        "    hs-source-dirs: .",
        "    Exposed-Modules: Sheet" ++ sheetNumber,
        "    Build-Depends: base >= 3",
        "",
        "Test-Suite sheet" ++ sheetNumber,
        "    type: exitcode-stdio-1.0",
        "    hs-source-dirs: ./tests",
        "    Main-is: Tests.hs",
        "    Other-Modules:  TestSheet" ++ sheetNumber,
        "    Build-Depends:  base >= 3,",
        "                    test-utils,",
        "                    sheet" ++ sheetNumber,
        ""
    ]

mainFileContents :: String -> String
mainFileContents sheetNumber = unlines [
        "module Sheet" ++ sheetNumber ++ " where",
        ""
    ]

testMainFileContents :: String -> String
testMainFileContents sheetNumber = unlines [
        "import TestUtils (runTests)",
        "import TestSheet" ++ sheetNumber ++ " (sheet" ++ sheetNumber ++ "TestCases)",
        "",
        "main = runTests sheet" ++ sheetNumber ++ "TestCases",
        ""
    ]

testSheetFileContents :: String -> String
testSheetFileContents sheetNumber = unlines [
        "module TestSheet" ++ sheetNumber ++ " where",
        "    import Sheet" ++ sheetNumber ++ " ()",
        "",
        "    sheet" ++ sheetNumber ++ "TestCases = []",
        ""
    ]