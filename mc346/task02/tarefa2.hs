-- Giovanne RA173317
-- Paradigmas de Programacao
-- Tarefa 2

merge [] [] = []
merge [] b = b
merge a [] = a
merge (a:as) (b:bs)
    | a <= b = a : merge as (b:bs)
    | otherwise = b : merge (a:as) bs

mergesort :: Ord a => [a] -> [a]
mergesort [] = []
mergesort [a] = [a]
mergesort a =
    merge (mergesort left) (mergesort right)
    where left = take half a 
          right = drop half a 
          half = length a `div` 2