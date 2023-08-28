module Date (showDate) where

import Data.Maybe

type Date = (Integer, Integer, Integer)

showDate :: Date -> String
showDate (d, m, y) = fromMaybe "invalid" $ showDate2 d m y

showDate2 :: Integer -> Integer -> Integer -> Maybe String
showDate2 d m y = do
    m2 <- month m
    d2 <- suffix d
    return $ concat [show d, d2, " ", m2, ", ", show y]

suffix :: Integer -> Maybe String
suffix 11 = Just "th"
suffix 12 = Just "th"
suffix 13 = Just "th"
suffix n | validDate n && n `mod` 10 == 1 = Just "st"
suffix n | validDate n && n `mod` 10 == 2 = Just "nd"
suffix n | validDate n && n `mod` 10 == 3 = Just "rd"
suffix n | validDate n = Just "th"
suffix _ = Nothing

validDate :: Integer -> Bool
validDate n = n > 0 && n < 32

month :: Integer -> Maybe String
month 1 = Just "January"
month 2 = Just "February"
month 3 = Just "March"
month 4 = Just "April"
month 5 = Just "May"
month 6 = Just "June"
month 7 = Just "July"
month 8 = Just "August"
month 9 = Just "September"
month 10 = Just "October"
month 11 = Just "November"
month 12 = Just "December"
month _ = Nothing
