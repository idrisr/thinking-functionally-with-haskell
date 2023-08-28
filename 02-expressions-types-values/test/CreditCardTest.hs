module CreditCardTest where

import CreditCard
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck

myElements :: Gen Int
myElements = oneof $ pure <$> [0..9]

sampleWithResampling :: Gen [Int]
sampleWithResampling = vectorOf 8 myElements

ccTests :: TestTree
ccTests =
    testGroup
        "CC"
        [ unitTests
        , propTests
        ]

unitTests :: TestTree
unitTests =
    testGroup
        "unit"
        [ let sut = "63245134"
              wot = Just 28
              got = cinSum sut
           in testCase "" $ got @?= wot
        , let sut = "6324513428"
              wot = True
              got = valid sut
           in testCase "" $ got @?= wot
        , let sut = "6324513429"
              wot = False
              got = valid sut
           in testCase "" $ got @?= wot
        ]

propTests :: TestTree
propTests =
    testGroup
        "property"
        [


        ]
