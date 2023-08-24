module ParserTest (parserTests) where

import Parser
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck
import Data.Char

parserTests :: TestTree
parserTests = testGroup "Parser" [unitTests, propTests]

propSat :: String -> Bool
propSat s = apply (sat isAlpha) s == apply (sat3 isAlpha) s

unitTests :: TestTree
unitTests =
    testGroup
        "Unit"
        [ let sut = "asdf"
              got = apply (sat isLower) sut
              wot = [('a', "sdf")]
           in testCase "" $ got @?= wot
        , let sut = "asdf"
              got = apply (sat2 isLower) sut
              wot = [('a', "sdf")]
           in testCase "" $ got @?= wot
        ]

propTests :: TestTree
propTests =
    testGroup
        "Property"
        [ testProperty "" propSat
        ]
