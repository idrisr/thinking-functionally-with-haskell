module CreditCard where

import Text.Read
import Data.Maybe

type CIN = String -- 8 digits

addSum :: CIN -> CIN
addSum s = fromMaybe "invalid" a
  where
    a = do
        s1 <- cinSum s
        return $ s ++ show s1

intToList :: Int -> [Int]
intToList n = map (\c -> read [c]) (show n)

-- get sum of all digits
cinSum :: CIN -> Maybe Int
cinSum c = do
    c1 <- readMaybe c :: Maybe Int
    let xs = take 8 $ intToList c1
    return $ sum xs

-- get last 2 digits from CIN
checkSum :: CIN -> Maybe Int
checkSum c = do
    let xs = drop (length c - 2) c
    readMaybe xs

valid :: CIN -> Bool
valid c | length c /= 10 = False
valid c = fromMaybe False a
  where
    a = do
        y <- checkSum c
        z <- cinSum c
        return $ y == z
