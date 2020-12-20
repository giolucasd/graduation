-- Giovanne RA173317
-- Paradigmas de Programacao
-- Tarefa 3

import Data.Char (toLower)

-----------
-- soma1 --
-----------

hasTuple _ [] = False
hasTuple key (a:as) =
    if fst a == key then
        True
    else
        hasTuple key as

-- assumes that tuples key doesn't repeat in the list
soma1 :: (Eq a) => a -> [(a,Int)] -> [(a,Int)]
soma1 key [] = [(key, 1)]
soma1 key (a:as) =
    if hasTuple key (a:as) then
        if fst a == key then
            (fst a, snd a + 1):as
        else
            a:(soma1 key as)
    else
        (soma1 key []) ++ (a:as)

--------------------
-- vogalmaiscomum --
--------------------

isVowel :: Char -> Bool
isVowel c = elem c "aeiou"

tupleMax :: (Char, Int) -> (Char, Int) -> (Char, Int)
tupleMax a b
    | (snd a) > (snd b) = a
    | otherwise = b

vowelList :: String -> String
vowelList = filter isVowel

charCounter :: String -> [(Char,Int)]
charCounter [] = []
charCounter (a:as) = soma1 a (charCounter as)

vowelCounter :: String -> [(Char, Int)]
vowelCounter [] = []
vowelCounter charList = charCounter (vowelList charList)

lowerString :: String -> String
lowerString = map toLower

-- assumes that the argument is a string with at leat one vowel
vogalmaiscomum :: String -> Char
vogalmaiscomum charList = fst (foldl1 tupleMax (vowelCounter (lowerString charList)))
