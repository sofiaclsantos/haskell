{-1. gere as listas:

a)		[1,11,121,1331,14641,161051,1771561]	

seq11 :: [Int]
seq11 = [11^x | x <- [0..6]]

main :: IO ()
main = putStrLn $ show $ seq11

b)	 	 [1,2,3,5,6,7,9,10,11,13,14,15,17,18,19,21,22,23,25,26,27,29,30,31,33,34,35,37,38,39]	

seqSem4 :: [Int]
seqSem4 = [x | x <- [1..39], mod x 4 /= 0]

main :: IO ()
main = putStrLn $ show seqSem4

c)		["AaBB",	 "AbBB",	 "AcBB",	 "AdBB",	 "AeBB",	 "AfBB","AgBB"]	

alf :: [String]
alf = [ "A" ++ [x] ++ "BB" | x <- ['a'..'g']]

main :: IO ()
main = putStrLn $ show $ alf

e)		[1.0,0.5,0.25,0.125,0.0625,0.03125]	

div2 :: [Double]
div2 = [ 1.0 / 2^x | x <- [0..5]]

main :: IO ()
main = putStrLn $ show $ div2

f)		[1,10,19,28,37,46,55,64]	

sub9 :: [Int]
sub9 = [ 1+9*x  | x <- [0..8]]

main :: IO ()
main = putStrLn $ show $ sub9 

h)		['@','A','C','D','E','G','J','L']
seqLetras :: [Char]
seqLetras = ['@','A','C','D','E','G','J','L']

main :: IO ()
main = putStrLn $ show seqLetras

Crie uma função	que	verifique se o tamanho de uma String é par ou não. Use Bool como retorno.
ePar :: String -> Bool
ePar str = (length str `mod` 2) == 0

main :: IO ()
main = print (ePar "Fatec")

2.3) Escreva uma função que receba um vetor de Strings e retorne uma lista com todos os elementos em ordem reversa.

inverte:: [String] -> [String]
inverte xs = reverse xs

main :: IO ()
main = putStrLn $ show $ inverte ["Sofia","Clementino", "dos", "Santos"]

2.4) Escreva uma função que receba um vetor de Strings e retorne uma lista com o tamanho de cada String. As palavras de tamanho par devem ser excluídas da resposta.

soImpar:: [String] -> [Int]
soImpar xs = [length s | s <- xs, length s `mod` 2 /= 0]

-- Testando
main :: IO ()
main = print $ soImpar ["Sofia","Gato","Menino","Cadeado"]

2.6) Faça uma função que receba uma String e retorne True se esta for um palíndromo; caso contrário, False.

palindromo :: String -> Bool
palindromo str = str == reverse str

main :: IO ()
main = do
    print $ palindromo "arara"   
    print $ palindromo "haskell" 

2.7) Faça uma função que receba um inteiro e retorne uma tupla, contendo: o dobro deste número na primeira coordenada, o triplo na segunda, o quádruplo na terceira e o quíntuplo na quarta.

tuplas:: Int -> (Int, Int, Int, Int)
tuplas n = (2*n, 3*n, 4*n, 5*n)

main :: IO ()
main = print $ tuplas 3
-}
