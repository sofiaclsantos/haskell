module Aula4 where

-- data [Int] = [] | Int : [Int]
-- data [Char] = [] | Char : [Char]

-- Tipo Recursivo (pq ele chama ele mesmo)
-- Quantos valores ha no tipo Lista?
-- Dois! Quais? Nill e Elem
-- O Nil tem 0 campos
-- O Elem tem 2 campos, Int e o proprio Lista
data Lista = Nil | Elem Int Lista 
    deriving Show

comprimento :: Lista -> Int
comprimento Nil = 0 -- Caso base da recursao
-- x :: Int, resto :: Lista
comprimento (Elem x resto) = 1 + comprimento resto

-- String = [Char]
-- data [Char] = [] | Char : [Char]

-- Guards: sao condicoes booleanas e imitam o if
tiraVogal :: String -> String
tiraVogal [] = [] -- Caso base da recursao (toda recursao precisa de caso base)
tiraVogal (letra : resto)
    | elem letra "AEIOUaeiou" = tiraVogal resto
    | otherwise = letra : tiraVogal resto

tiraPar :: [Int] -> [Int]
tiraPar [] = []
tiraPar (x : xs)
    | even x = tiraPar xs
    | otherwise = x : tiraPar xs

contaPar :: [Int] -> Int
contaPar [] = 0
contaPar (x : xs)
    | even x = 1 + contaPar xs
    | otherwise = contaPar xs

tiraCinco :: [String] -> [String]
tiraCinco [] = []
tiraCinco (xs: xss)
    | length xs > 5 = tiraCinco xss
    | otherwise = xs : tiraCinco xss

triplo :: Double -> Double 
triplo x = 3 * x