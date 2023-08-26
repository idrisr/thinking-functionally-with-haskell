module Song where

import Data.Char

song :: Int -> String
song 0 = ""
song n = concat [song (n - 1), "\n", verse n]

verse :: Int -> String
verse n = concat [line1 n, line2 n, line3 n, line4 n]

line1 :: Int -> String
line1 n = concat [numToWord n, " went to mow", "\n"]

line3 :: Int -> String
line3 1 = numToWord 1 ++  " and his dog\n"
line3 n = concat [numToWord n, ", ", fmap toLower (line3 $ n - 1)]

line4, line2 :: Int -> String
line2 _ = "Went to mow a meadow\n"
line4 = line2

numToWord :: Int -> String
numToWord 1 = "One man"
numToWord 2 = "Two men"
numToWord 3 = "Three men"
numToWord 4 = "Four men"
numToWord 5 = "Five men"
numToWord 6 = "Six men"
numToWord 7 = "Seven men"
numToWord 8 = "Eight men"
numToWord _ = "Nine men"
