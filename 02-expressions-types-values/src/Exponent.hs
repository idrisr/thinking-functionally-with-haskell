module Exponent where

import Prelude hiding (exp)

exp :: Integer -> Integer -> Integer
exp x n
    | n == 0 = 1
    | n == 1 = x
    | otherwise = x * exp x (n - 1)

-- How many multiplications does it take to evaluate exp x n?
-- n
--
-- Dick, a clever programmer, claims he can compute exp x n with far fewer multiplications

exp2 :: Integer -> Integer -> Integer
exp2 x n
    | n == 0 = 1
    | n == 1 = x
    | even n = exp2 (x*x) (n `div` 2)
    -- odd case
    | otherwise = exp2 (x*x) (n `div` 2) * x
