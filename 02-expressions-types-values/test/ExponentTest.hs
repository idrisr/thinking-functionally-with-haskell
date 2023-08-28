module ExponentTest where

import Exponent
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck
import Prelude hiding (exp)

prop_exp :: Integer -> NonNegative Integer -> Bool
prop_exp x (NonNegative n) = exp x n == exp2 x n

expTests :: TestTree
expTests =
    testGroup
        "Exp"
        [ unitTests
        , propTests
        ]

unitTests :: TestTree
unitTests =
    testGroup
        "unit"
        [ let
            x = 3
            n = 4
            got = exp2 x n
            wot = 81 in
            testCase "" $ got @?= wot
        , let
            x = 1
            n = 3
            got = exp2 x n
            wot = 1 in
            testCase "" $ got @?= wot
        ]

propTests :: TestTree
propTests =
    testGroup
        "property"
        [ testProperty "" prop_exp
        ]
