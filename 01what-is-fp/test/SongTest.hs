module SongTest where

import Song
import Test.Tasty
import Test.Tasty.HUnit
import Text.RawString.QQ

songTests :: TestTree
songTests =
    testGroup
        "All Song"
        [ unitTests
        , verseTests
        , lineTests
        ]

unitTests :: TestTree
unitTests =
    testGroup
        "Song"
        [ testCase "0" $ song0 @=? song 0
        , testCase "1" $ song1 @=? song 1
        , testCase "2" $ song2 @=? song 2
        , testCase "3" $ song3 @=? song 3
        ]

verseTests :: TestTree
verseTests =
    testGroup
        "verse"
        [ let got = verse 1
              wot = verse1
           in testCase "1" $ wot @=? got
        , let got = verse 2
              wot = verse2
           in testCase "2" $ wot @=? got
        ]

lineTests :: TestTree
lineTests =
    testGroup
        "line3"
        [ let got = line3 1
              wot =
                [r|One man and his dog
|]
           in testCase "1" $ wot @=? got
        , let got = line3 2
              wot =
                [r|Two men, one man and his dog
|]
           in testCase "2" $ wot @=? got
        , let got = line3 3
              wot =
                [r|Three men, two men, one man and his dog
|]
           in testCase "3" $ wot @=? got
        , let got = line3 4
              wot =
                [r|Four men, three men, two men, one man and his dog
|]
           in testCase "4" $ wot @=? got
        ]

verse1 :: String
verse1 =
    [r|One man went to mow
Went to mow a meadow
One man and his dog
Went to mow a meadow
|]

verse2 :: String
verse2 =
    [r|Two men went to mow
Went to mow a meadow
Two men, one man and his dog
Went to mow a meadow
|]

song0 :: String
song0 = ""

song1 :: String
song1 =
    [r|
One man went to mow
Went to mow a meadow
One man and his dog
Went to mow a meadow
|]

song2 :: String
song2 =
    [r|
One man went to mow
Went to mow a meadow
One man and his dog
Went to mow a meadow

Two men went to mow
Went to mow a meadow
Two men, one man and his dog
Went to mow a meadow
|]

song3 :: String
song3 =
    [r|
One man went to mow
Went to mow a meadow
One man and his dog
Went to mow a meadow

Two men went to mow
Went to mow a meadow
Two men, one man and his dog
Went to mow a meadow

Three men went to mow
Went to mow a meadow
Three men, two men, one man and his dog
Went to mow a meadow
|]
