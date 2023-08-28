module First where

first :: (a -> Bool) -> [a] -> Maybe a
first _ [] = Nothing
first f xs = Just $ (head . filter f) xs

-- Maybe a -> Maybe a
-- |Maybe a| ^ |Maybe a|
-- |a + 1| ^ |a+1|
