module Main (main) where

import Test.Tasty
import TestA
import TestE
import SongTest

tests :: TestTree
tests =
    testGroup
        "Main"
        [ testsA
        , testsE
        , songTests
        ]

main :: IO ()
main = defaultMain tests
