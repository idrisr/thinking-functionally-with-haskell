module Palindrome where

import Data.Char

isPalindrome :: String -> Bool
isPalindrome = sameReverse . fmap toLower . strip

strip :: String -> String
strip = filter isLetter

sameReverse :: String -> Bool
sameReverse s = reverse s == s

palindrome :: IO ()
palindrome = do
    putStrLn "Enter a string:"
    x <- getLine
    if isPalindrome x
    then putStrLn "Yes!"
    else putStrLn "No!"
