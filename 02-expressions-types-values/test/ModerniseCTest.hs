module ModerniseCTest where

import ModerniseC
import Test.Tasty
import Test.Tasty.HUnit

modTests :: TestTree
modTests = testGroup "" [unitTests]

unitTests :: TestTree
unitTests =
    testGroup
        "unit"
        [ let wot = "The Morphology Of Prex – An Essay In Meta-algorithmics"
              sut = "The morphology of prex – an essay in meta-algorithmics"
              got = modernise sut
           in testCase "" $ got @?= wot
        ]
