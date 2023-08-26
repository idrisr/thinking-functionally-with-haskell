module CommonWords where

import Data.Char
import Prelude hiding (words)

-- What are the 100 most common words in
-- War and Peace?

-- What are the 50 most common words in
-- Love’s Labours Lost?

words :: String -> [String]
words = undefined

sortWords :: [String] -> [String]
sortWords = undefined

countRuns :: [String] -> [(Int, String)]
countRuns = undefined

sortRuns :: [(Int, String)] -> [(Int, String)]
sortRuns = undefined

showRun :: (Int, String) -> String
showRun = undefined

commonWords :: Int -> String -> String
{- hlint ignore "Use concatMap" -}
commonWords n =
    concat
        . map showRun
        . take n
        . sortRuns
        . countRuns
        . sortWords
        . words
        . map toLower

commonWords1 :: Int -> String -> String
{- hlint ignore "Use concatMap" -}
commonWords1 n =
    concat
        . map showRun
        . take n
        . sortRuns
        . countRuns
        . sortWords
        . map (map toLower)
        . words
