-- Giovanne RA173317
-- Paradigmas de Programacao
-- Tarefa 3

------------
-- Arvore --
------------

data Tree a = Vazia | No a (Tree a) (Tree a) deriving (Eq, Show, Read)

------------------------
-- Funcoes Auxiliares --
------------------------

insereAbb Vazia novo = No novo Vazia Vazia
insereAbb (No raiz ae ad) novo
    | raiz == novo =  No raiz ae ad
    | raiz < novo  =  No novo (insereAbb ae raiz) ad
    | otherwise = No novo ae (insereAbb ad raiz)

listaParaAbb :: Ord a => [a] -> Tree a
listaParaAbb = foldl insereAbb Vazia

maiorNo (No raiz _ Vazia) = raiz
maiorNo (No raiz _ ad) = maiorNo ad

menorNo (No raiz Vazia _) = raiz
menorNo (No raiz ae _) = menorNo ae

removeMenor (No raiz Vazia ad) = ad
removeMenor (No raiz ae ad) =  No raiz (removeMenor ae) ad

removeMaior (No raiz ae Vazia) = ae
removeMaior (No raiz ae ad) =  No raiz ae (removeMaior ad)

removeRaiz Vazia = Vazia
removeRaiz (No _ Vazia ad) = ad
removeRaiz (No _ ae Vazia) = ae
removeRaiz (No _ ae ad) = No (maiorNo ae) (removeMaior ae) ad

-----------------
-- removeabbif --
-----------------

removeabbif :: Ord a => (a -> Bool) -> Tree a -> Tree a
removeabbif funcaoCondicional Vazia = Vazia

removeabbif funcaoCondicional (No raiz ae ad)
    | funcaoCondicional raiz = removeRaiz (No raiz novaAe novaAd)
    | otherwise = No raiz novaAe novaAd
    where
        novaAe = removeabbif funcaoCondicional ae
        novaAd = removeabbif funcaoCondicional ad