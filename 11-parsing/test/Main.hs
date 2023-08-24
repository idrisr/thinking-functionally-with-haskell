module Main where

import Test.Tasty
import ParserTest

main :: IO ()
main = defaultMain parserTests
