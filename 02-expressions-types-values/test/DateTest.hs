module DateTest where

import Date
import Test.Tasty
import Test.Tasty.HUnit

dateTests :: TestTree
dateTests =
    testGroup
        "Date"
        [ unitTests
        , propTests
        ]

unitTests :: TestTree
unitTests =
    testGroup
        "unit"
        [ let wot = "10th December, 2013"
              got = showDate (10, 12, 2013)
           in testCase "" $ got @?= wot
        , let wot = "21st November, 2020"
              got = showDate (21, 11, 2020)
           in testCase "" $ got @?= wot
        , let wot = "11th November, 2020"
              got = showDate (11, 11, 2020)
           in testCase "" $ got @?= wot
        , let wot = "12th November, 2020"
              got = showDate (12, 11, 2020)
           in testCase "" $ got @?= wot
        , let wot = "13th January, 2020"
              got = showDate (13, 1, 2020)
           in testCase "" $ got @?= wot
        , let wot = "invalid"
              got = showDate (32, 1, 2020)
           in testCase "" $ got @?= wot
        , let wot = "invalid"
              got = showDate (2, 0, 2020)
           in testCase "" $ got @?= wot
        ]

propTests :: TestTree
propTests =
    testGroup
        "property"
        []
