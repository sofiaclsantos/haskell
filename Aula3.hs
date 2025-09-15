module Aula3 where
import GHC.Generics (S)
{-
-- o tipo Dia é um tipo de enumeracao, assim como Enum em java
data Dia = Domingo | Segunda | Terca | Quarta | Quinta | Sexta | Sabado
    deriving (Show, Eq, Ord, Enum, Read)

--Pattern matching: é uma forma de desconstruir com o tipo de entrada
--e programar a funcao como se tivesse num switch
agenda :: Dia -> String
agenda Segunda = "Aula de IA"
agenda Quarta  = "Aula de Haskell"
agenda Quinta  = "Pre-sexta, bar"
agenda Sexta   = "bar dnv"
agenda Sabado  = "Bar e estudar Haskell"
agenda _       = "Ninguem liga" --default do switch no java

{- outro jeito de fzr
agenda' :: Dia -> String
agenda'  x =
    case x of
        Segunda -> "Aula de IA"
        Quarta -> "Aula de Haskell"
        Quinta -> "Pre-sexta, bar"
        Sexta -> "bar dnv"
        Sabado -> "Bar e estudar Haskell"
        _      -> "Ninguem liga"-}


--numDia é uma função parcial, o seja, existem entradas nao tratadas (bem mais Int doq Dia)
--função total trata todas as entradas
numDia :: Int -> Maybe Dia
numDia 0 = Just Domingo
numDia 1 = Just Segunda
numDia 2 = Just Terca
numDia 3 = Just Quarta
numDia 4 = Just Quinta
numDia 5 = Just Sexta
numDia 6 = Just Sabado
numDia _ = Nothing

-- a saida num dia possui uma entrada inteira e sua saida é uma duvida
-- ou sai String de erro ou um Dia validado
-- Either Erro Acerto (fazer sempre nessa ordem, direita certo e esquerda erro)
numDia' :: Int -> Either String Dia
numDia' 0 = Right Domingo
numDia' 1 = Right Segunda
numDia' 2 = Right Terca
numDia' 3 = Right Quarta
numDia' 4 = Right Quinta
numDia' 5 = Right Sexta
numDia' 6 = Right Sabado
numDia' _ = Left "Dia invalido"

-- o pattern matching descontruiu o tipo maybe dia, revelando 2 possibilidades
-- Just dia, onde dia é uma variavel do tipo Dia (Domingo .. Sabado)
-- ou Nothing
mostrar :: Maybe Dia -> String
mostrar (Just dia) = "O dia eh: " ++ show dia
mostrar Nothing = "O usuario digitou algo errado"
-}

-- Defina o tipo Correncia
data Correncia = BRL | USD | EUR deriving Show

-- Defina o tipo Moeda
data Moeda = Moeda {
    valor :: Double,
    correncia :: Correncia
} deriving Show

-- Defina a função de conversão
conversaoReal :: Moeda -> Moeda
conversaoReal (Moeda valor USD) = Moeda (5.42 * valor) BRL
conversaoReal (Moeda valor EUR) = Moeda (6.31 * valor) BRL
conversaoReal moeda = moeda

conversaoDolar :: Moeda -> Moeda
conversaoDolar (Moeda valor BRL) = Moeda (0.18 * valor) USD
conversaoDolar (Moeda valor EUR) = Moeda (1.16 * valor) USD
conversaoDolar moeda = moeda

acrescimo :: Double -> Moeda -> Moeda
acrescimo x (Moeda valor correncia) = Moeda (valor+x) correncia 

-- Tipo de dado algebrico no geral
data PessoaFatec = Prof String String
                 | Aluno String String Int
                 | Func String deriving Show

salarioBase :: PessoaFatec -> Moeda
salarioBase (Func _) = Moeda 2800 BRL
salarioBase (Prof _ _) = Moeda 6000 BRL
salarioBase (Aluno _ _ _) = Moeda 280 BRL
