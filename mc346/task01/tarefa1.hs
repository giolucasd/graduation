-- Giovanne RA173317
-- Paradigmas de Programacao
-- Tarefa 1

intercala2 [] [] = []
intercala2 [] b = b
intercala2 a [] = a
intercala2 (a:as) (b:bs) = ([a, b] ++ (intercala2 as bs))

element_wise_sum _ [] = []
element_wise_sum x (a:as) = [(a + x)] ++ (element_wise_sum x as)

cumsum [] = []
cumsum (a:as) = [a] ++ element_wise_sum a (cumsum as)