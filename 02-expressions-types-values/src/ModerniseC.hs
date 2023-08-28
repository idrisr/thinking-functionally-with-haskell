module ModerniseC (modernise) where

import Data.Char

modernise :: String -> String
modernise s = unwords $ capitalize <$> words s

capitalize :: String -> String
capitalize [] = []
capitalize (x:xs) = toUpper x : xs
