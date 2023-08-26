module Anagrams where

-- EHT CDOORRSSW AAAGMNR ACDIINORTY.

-- 6-letter words
-- --------------
-- ...
-- eginor: ignore,region
-- eginrr: ringer
-- eginrs: resign,signer,singer
-- ...

anagrams :: Int -> [String] -> String
anagrams n = display . wordListN n

-- 5 letter words
-- aegln: angle, glean
-- acost: ascot, coats
-- ehllo: hello
-- aadnp: panda
-- anagrams 5 ["angle", "hello"]

wordListN :: Int -> [String] -> [String]
wordListN n = undefined

display :: [String] -> String
display = undefined
