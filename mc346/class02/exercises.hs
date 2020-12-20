- Giovanne RA173317
-- Paradigmas de Programacao
-- Aula 2


last_element (a:as) =
    if as == [] then
        a
    else
        last_element as


element_first_position _ [] = 0

element_first_position x (a:as) =
    if x == a then
        1
    else
        ((element_first_position x as) + 1)


element_wise_sum x (a:as) =
    if as == [] then
        [(a + x)]
    else
        ([(a + x)] ++ (element_wise_sum x as))


element_positions_list _ [] = []

element_positions_list x (a:as) =
    if x == a then
        element_wise_sum 1 ([0] ++ (element_positions_list x as))
    else
        element_wise_sum 1 (element_positions_list x as)


bigger (a:as) =
    if as == [] then
        a
    else
        if a > bigger as then
            a
        else bigger as


revert (a:as) =
    if as == [] then
        [a]
    else
        revert as ++ [a]

intercala2 [] [] = []
intercala2 [] b = b
intercala2 a [] = a
intercala2 (a:as) (b:bs) = ([a, b] ++ (intercala2 as bs))
