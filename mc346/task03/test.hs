soma1 [] x = [(x,1)]
soma1 ((ch,v):ls) x 
    | x==ch = (ch,v+1):ls
    | otherwise = (ch,v):(soma1 ls x)