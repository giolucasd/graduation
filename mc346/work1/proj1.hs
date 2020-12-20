-- Giovanne RA173317
-- Paradigmas de Programacao
-- Trabalho 1

import Data.Char (toLower)
import Numeric


--------------------------
-- isDigitOrPunctuation --
--------------------------

isDigitOrPunctuation c = elem c ".1234567890"
isDigit c = elem c "123456789"

----------------
-- increment1 --
----------------

increment1 [] x = [(x,1)]
increment1 ((key,value):ls) x
    | x==key = (key,value+1):ls
    | otherwise = (key,value):(increment1 ls x)

-----------------------------------------------------------------------------------------
-- addChar                                                                             --
-----------------------------------------------------------------------------------------
-- args:                                                                               --
--   lista de strings                                                                  --
--   char a se adicionar na lista                                                      --
--   adicionar no ultimo elemento (booleano) - cria outro elemento na lista caso falso --
-----------------------------------------------------------------------------------------

addChar [] x _ = [[x]]
addChar (a:as) x previous
    | previous = ((a++[x]):as)
    | otherwise = ([[x]] ++ (a:as))

----------------------------------------------------------------------
-- segment                                                          --
----------------------------------------------------------------------
-- args:                                                            --
--   string de entrada (string)                                     --
--   o char anterior era digito ou pontuacao (booleano)             --
--   acumulador com os segmentos que sao numeros (lista de strings) --
----------------------------------------------------------------------

--  ao chamar "segment string_de_entrada False [],
-- obtem-se uma lista com todos os numeros da string de entrada  

segment []  _ accumulator = accumulator
segment (a:as) True accumulator
    | isDigitOrPunctuation a = (segment as True (addChar accumulator a True))
    | otherwise = (segment as False accumulator)
segment (a:as) False accumulator
    | isDigit a = (segment as True (addChar accumulator a False))
    | otherwise = (segment as False accumulator)

----------------
-- allNumbers --
----------------

allNumbers text = segment text False []

-------------------------------------------------------------------------------
-- incrementFstDigit                                                         --
-------------------------------------------------------------------------------
-- args:                                                                     --
--   numero do qual o contador do primeiro digito será incrementado (string) --
--   acumulador lista de tuplas (char, int)                                  --
-------------------------------------------------------------------------------
incrementFstDigit [] accumulator = accumulator
incrementFstDigit (a:as) accumulator = increment1 accumulator a

----------------------------------------------
-- countFstDigit                            --
----------------------------------------------
-- args:                                    --
--   lista de numeros (lista de strings)    --
--   acumulador lista de tuplas (char, int) --
----------------------------------------------

countFstDigit [] accumulator = accumulator
countFstDigit (a:as) accumulator = countFstDigit as (incrementFstDigit a accumulator)

------------------------------------------------------------------------------------
--fstDigitCounters                                                                --
------------------------------------------------------------------------------------
-- dado um texto retorna uma lista de tuplas                                      --
-- na qual as tuplas sao formadas da seguinte maneira                             --
-- o primeiro elemento é                                                          --
--      um digito                                                                 --
-- o segundo elemento é                                                           --
--      o número de vezes que esse digito é primeiro dígito de um número no texto --
------------------------------------------------------------------------------------

fstDigitCounters text = countFstDigit (allNumbers text) []


-----------------------------------------------------------------------------------
-- numbersCount                                                                  --
-----------------------------------------------------------------------------------
-- dada a lista de tuplas (char, contador) retorna a soma de todos os contadores --
-----------------------------------------------------------------------------------

numbersCount [] = 0
numbersCount (a:as) = (snd a + numbersCount as)

----------------
-- digitCount --
----------------
digitCount [] _ = 0
digitCount (a:as) digit
    | fst a==digit = snd a
    | otherwise = digitCount as digit

-----------------
-- frequencies --
-----------------

oneFrac text = (digitCount (fstDigitCounters text) '1')/(numbersCount (fstDigitCounters text))

twoFrac text = (digitCount (fstDigitCounters text) '2')/(numbersCount (fstDigitCounters text))

threeFrac text = (digitCount (fstDigitCounters text) '3')/(numbersCount (fstDigitCounters text))

fourFrac text = (digitCount (fstDigitCounters text) '4')/(numbersCount (fstDigitCounters text))

fiveFrac text = (digitCount (fstDigitCounters text) '5')/(numbersCount (fstDigitCounters text))

sixFrac text = (digitCount (fstDigitCounters text) '6')/(numbersCount (fstDigitCounters text))

sevenFrac text = (digitCount (fstDigitCounters text) '7')/(numbersCount (fstDigitCounters text))

eightFrac text = (digitCount (fstDigitCounters text) '8')/(numbersCount (fstDigitCounters text))

nineFrac text = (digitCount (fstDigitCounters text) '9')/(numbersCount (fstDigitCounters text))

------------------
-- formatFloatN --
------------------

formatFloatN floatNum numOfDecimals = showFFloat (Just numOfDecimals) floatNum ""

------------------------------------------------------------
-- workAnswer                                             --
------------------------------------------------------------
-- dado um texto, devolve a resposta do projeto formatada --
------------------------------------------------------------

workAnswer text = (("1 : " ++ formatFloatN (oneFrac text) 2) ++ "\n" ++
    ("2 : " ++ formatFloatN (twoFrac text) 2) ++ "\n" ++
    ("3 : " ++ formatFloatN (threeFrac text) 2) ++ "\n" ++
    ("4 : " ++ formatFloatN (fourFrac text) 2) ++ "\n" ++
    ("5 : " ++ formatFloatN (fiveFrac text) 2) ++ "\n" ++
    ("6 : " ++ formatFloatN (sixFrac text) 2) ++ "\n" ++
    ("7 : " ++ formatFloatN (sevenFrac text) 2) ++ "\n" ++
    ("8 : " ++ formatFloatN (eightFrac text) 2) ++ "\n" ++
    ("9 : " ++ formatFloatN (nineFrac text) 2))

----------
-- main --
----------

main = do 
    text <- getContents
    let saida = workAnswer text
    putStrLn saida
       

