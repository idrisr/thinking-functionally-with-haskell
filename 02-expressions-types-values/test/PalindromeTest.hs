{-# LANGUAGE QuasiQuotes #-}

module PalindromeTest where

import Test.Tasty
import Test.Tasty.HUnit
import Palindrome
import Text.RawString.QQ

palTests :: TestTree
palTests = testGroup "Palindrome" [unitTests]

unitTests :: TestTree
unitTests = testGroup "unit" [
    let sut = "Madam, I'm Adam"
        got = isPalindrome sut
        wot = True in
        testCase "" $ got @?= wot
  , let sut = "A Man, a plan, a canal - Suez!"
        got = isPalindrome sut
        wot = False in
        testCase "" $ got @?= wot
  , let sut = [r|
Doc, note I dissent. A fast never prevents a fatness.
I diet on cod.
|]
        got = isPalindrome sut
        wot = True in
        testCase "" $ got @?= wot
    ]
