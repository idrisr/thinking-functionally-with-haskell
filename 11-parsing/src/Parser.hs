module Parser where

import Prelude hiding (fail)
import Data.Bifunctor

newtype Parser a = Parser (String -> [(a, String)])

apply :: Parser a -> String -> [(a, String)]
apply (Parser a) = a

fail :: Parser a
fail = Parser $ const []

instance Functor Parser where
    fmap f (Parser p) = Parser $ fmap (first f) . p

instance Applicative Parser where
    pure x = Parser $ const [(x, mempty)]
    f <*> a = Parser $ \s ->
        [ (y, s2)
        | (f1, s1) <- apply f s
        , (y, s2) <- apply (f1 <$> a) s1
        ]

instance Monad Parser where
    p >>= q = Parser $ \s ->
        [ (y, s2)
        | (x, s1) <- apply p s
        , (y, s2) <- apply (q x) s1
        ]

guard :: Bool -> Parser ()
guard True = return ()
guard False = fail

parse :: Parser a -> String -> a
parse p = fst . head . apply p

getc :: Parser Char
getc = Parser f
  where
    f [] = []
    f (c : cs) = [(c, cs)]

sat :: (Char -> Bool) -> Parser Char
sat p = do
    c <- getc
    if p c
    then return c
    else fail

sat2 :: (Char -> Bool) -> Parser Char
sat2 p = do
    c <- getc
    _ <- guard $ p c
    return c

sat3 :: (Char -> Bool) -> Parser Char
sat3 p = getc >>= \c -> guard (p c) >> return c
