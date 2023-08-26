module TestE (testsE) where

import Test.Tasty
import Test.Tasty.QuickCheck

testsE :: TestTree
testsE = testGroup "" [propTests]

propAssocAdd :: (Eq a, Num a) =>  a -> a -> a -> Bool
propAssocAdd x y z = (x + y) + z == x + (y + z)

type PropInt = Int -> Int -> Int -> Bool
type PropFloat = Float -> Float -> Float -> Bool

propTests :: TestTree
propTests = testGroup "assoc" [
    testProperty "Int" (propAssocAdd::PropInt)
  , testProperty "Float" (propAssocAdd::PropFloat)
    ]
