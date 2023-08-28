module Main where

import Criterion.Main
import Exponent
import Prelude hiding (exp)

main :: IO ()
main =
    defaultMain
        [ let x = 4
              y = 10
           in bgroup
                "S"
                [ bench "exp" $ whnf (exp x) y
                , bench "exp2" $ whnf (exp2 x) y
                ]
        , let x = 121
              y = 13121
           in bgroup
                "M"
                [ bench "exp" $ whnf (exp x) y
                , bench "exp2" $ whnf (exp2 x) y
                ]
        , let x = 12132
              y = 13121
           in bgroup
                "L"
                [ bench "exp" $ whnf (exp x) y
                , bench "exp2" $ whnf (exp2 x) y
                ]
        ]
