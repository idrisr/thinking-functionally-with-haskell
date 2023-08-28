module Main (main) where

import CreditCardTest
import DateTest
import ExponentTest
import ModerniseCTest
import Test.Tasty
import PalindromeTest

tests :: TestTree
tests =
    testGroup
        ""
        [ modTests
        , expTests
        , dateTests
        , ccTests
        , palTests
        ]

main :: IO ()
main = defaultMain tests
