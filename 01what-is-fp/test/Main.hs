module Main (main) where

import Test.Tasty
import TestA

main :: IO ()
main = defaultMain testsA
