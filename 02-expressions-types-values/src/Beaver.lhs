> module Beaver where

Beaver is an eager evaluator, while
Susan is a lazy one.


> f :: Int -> Int
> f x = x + 1
> xs :: [Int]
> xs = replicate 10 1

> g :: Int
> g = head . map f $ xs


How many times would Beaver evaluate f in computing
    10

How many times would Susan?
    1

What alternative to head . map f would Beaver prefer?

> h :: Int
> h = f $ head xs

Susan would happily use

head . filter p

for a function that finds the first element of a list satisfying p.

Why would Beaver not use the same expression?
    it will filter the full list first before taking the head

Instead, Beaver would probably define something like

> first :: (a -> Bool) -> [a] -> a
> first p ys | null xs = error "Empty list"
>            | p x = x
>            | otherwise = first p $ tail ys
>            where x = head ys
