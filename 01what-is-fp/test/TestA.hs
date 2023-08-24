module TestA (testsA) where

import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck
import Data.List

double :: Integer -> Integer
double x = 2 * x

testsA :: TestTree
testsA =
    testGroup
        "A"
        [ unitTests
        ]

unitTests :: TestTree
unitTests =
    testGroup
        ""
        [ let got = map double [1, 4, 4, 3]
              wot = [2, 8, 8, 6]
           in testCase "" $ got @?= wot
        , let got = map (double . double) [1, 4, 4, 3]
              wot = [4, 16, 16, 12]
           in testCase "" $ got @?= wot
        , let got = map double []
              wot = []
           in testCase "" $ got @?= wot
        ]

propA :: [Integer] -> Bool
propA xs = (sum . map double) xs == (double . sum) xs

propB :: [Integer] -> Bool
propB xs = (sum . map sum) xs == (sum . concat) xs

propC :: [Integer] -> Bool
propC xs = (sum . sort) xs == sum xs

-- propTests :: TestTree
