-- This script creates a new package for solving an excercise sheet.
-- I am aware that Haskell is not ideal for scripting but I wanted to use it for
-- this purpose anyways to practice using Haskell in other contexts. 

import System.Posix.Internals (newFilePath)
import System.Directory (doesDirectoryExist, createDirectory)
import Data.Char (toLower)

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
            putStrLn "Please enter the name of the *Library* module to create:"
            libModuleName <- getLine
            let testModuleName = "Test" ++ libModuleName
            let testCasesVarName = lowerCamelCase libModuleName ++ "TestCases"
            let cabalFilePath = sheetDirectoryPath ++ "/sheet" ++ sheetNumber ++ ".cabal" 
            let libModulePath = sheetDirectoryPath ++ "/" ++ libModuleName ++ ".hs"
            let testDirectoryPath = sheetDirectoryPath ++ "/tests"
            let testMainFilePath = testDirectoryPath ++ "/Tests.hs"
            let testModulePath = testDirectoryPath ++ "/" ++ testModuleName ++ ".hs"

            putStrLn "The following files will be created:"
            putStrLn $ unlines $ map (" - " ++) [
                    sheetDirectoryPath,
                    cabalFilePath,
                    libModulePath,
                    testDirectoryPath,
                    testMainFilePath,
                    testModulePath
                ]
        
            putStrLn "Is this okay? [y]"
            confirmation <- getLine
            if confirmation /= "y"
                then
                    putStrLn "Aborting"
                else do
                    createDirectory sheetDirectoryPath
                    writeFile cabalFilePath $ cabalFileContents sheetNumber libModuleName testModuleName
                    writeFile libModulePath $ libModuleContents libModuleName

                    createDirectory testDirectoryPath
                    writeFile testMainFilePath $ testMainFileContents testModuleName testCasesVarName
                    writeFile testModulePath $ testModuleContents libModuleName testModuleName testCasesVarName

                    putStrLn $ "Created package for sheet " ++ sheetNumber ++ "!"
        )

cabalFileContents :: String -> String -> String -> String
cabalFileContents sheetNumber libModuleName testModuleName = unlines [
        "cabal-version: 3.6",
        "name: sheet" ++ sheetNumber,
        "version: 1.0.0",
        "build-type: Simple",
        "",
        "Library",
        "    hs-source-dirs: .",
        "    Exposed-Modules: " ++ libModuleName,
        "    Build-Depends: base >= 3",
        "",
        "Test-Suite sheet" ++ sheetNumber,
        "    type: exitcode-stdio-1.0",
        "    hs-source-dirs: ./tests",
        "    Main-is: Tests.hs",
        "    Other-Modules:  " ++ testModuleName,
        "    Build-Depends:  base >= 3,",
        "                    test-utils,",
        "                    sheet" ++ sheetNumber,
        ""
    ]

libModuleContents :: String -> String
libModuleContents libModuleName = unlines [
        "module " ++ libModuleName ++ " where",
        ""
    ]

testMainFileContents :: String -> String -> String
testMainFileContents testModuleName testCasesVarName = unlines [
        "import TestUtils (runTests)",
        "import " ++ testModuleName ++ " (" ++ testCasesVarName ++ ")",
        "",
        "main = runTests " ++ testCasesVarName,
        ""
    ]

testModuleContents :: String -> String -> String -> String
testModuleContents libModuleName testModuleName testCasesVarName = unlines [
        "module " ++ testModuleName ++ " where",
        "    import " ++ libModuleName ++ " ()",
        "",
        "    " ++ testCasesVarName ++ " = []",
        ""
    ]

lowerCamelCase :: String -> String
lowerCamelCase [] = []
lowerCamelCase (x:xs) = toLower x : xs