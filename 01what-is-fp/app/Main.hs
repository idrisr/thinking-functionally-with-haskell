module Main where

import Song
import Text.Read
import System.Environment (getArgs)

printUsage :: IO ()
printUsage = print "dude"

main :: IO ()
main = do
    args <- getArgs
    case args of
        [x] -> case readMaybe x :: Maybe Int of
            Just y -> putStr $ song $ min y 9
            Nothing -> printUsage
        _ -> printUsage
