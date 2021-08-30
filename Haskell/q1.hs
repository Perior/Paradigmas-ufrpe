module Q1 where

{-
Um aplicativo de música deseja computar as músicas e artistas mais ouvidos ao longo do ano dos seus usuários.
Assumindo que as informações de registro de músicas ouvidas estão estruturadas em uma lista de tuplas, 
as quais tem a seguinte estrutura (String, Int, Timestamp), onde o primeiro elemento é o nome da música, 
o segundo a duração que escutou a música (em segundos) e o terceiro a data/hora que esta música foi escutada, 
crie as seguintes funções em Haskell:

a. Uma função que dada a lista de registros de músicas ouvidas retorna a música mais ouvida
 ao longo do ano de 2020, ou seja, mais repetições da mesma música.

b. Uma função que dada a lista de registros de músicas ouvidas retorna a música que o usuário
 passou mais tempo escutando, ou seja, música cuja soma das durações ao longo do ano de 2020 é a maior.

-}

import Data.List (nub, sort, group, sortBy)
import Data.Ord (comparing)

type Data = [String]
type Hora = String
data Timestamp = Timestamp Data Hora
                deriving Show

--Funções de chamada no terminal
--Exemplo de entrada: [("rajadao", 120, (Timestamp ["12", "6", "2020"] "12:54")),("Problem", 135, (Timestamp ["20", "8", "2020"] "17:30")),("rajadao", 120, (Timestamp ["30", "8", "2020"] "10:11")),("Problem", 135, (Timestamp ["9", "6", "2020"] "8:50"))]

--Letra a)
maisEscutadas2020 lista = maisOuvidas(ordGroup(listaTitulos lista))
--Letra b)
segundosGastos lista = mostHeard (comparaTempos(ordGroup(calculaTempo lista))) (comparaTempos(ordGroup(calculaTempo lista)))

listaTitulos :: [(String, Int, Timestamp)] -> [String]
listaTitulos [] = []
listaTitulos ((a, b, (Timestamp c d)):xs) | elem "2020" c = [a] ++ listaTitulos xs
                                          | otherwise = listaTitulos xs

ordGroup :: Ord a => [a] -> [[a]]
ordGroup lista = (sortBy (comparing length) . group . sort $ lista)

maisOuvidas :: Eq a => [[a]] -> [a]
maisOuvidas [] = []
maisOuvidas (x:xs) | (length x) < length (maisOuvidas xs) = maisOuvidas xs
                   | otherwise = nub (x ++ maisOuvidas xs)

calculaTempo :: [(String, Int, Timestamp)] -> [(String, Int)]
calculaTempo [] = []
calculaTempo ((a, b, (Timestamp c d)):xs) | elem "2020" c = [(a, b)] ++ calculaTempo xs
                                          | otherwise = calculaTempo xs

somaSegundos :: [(a, Int)] -> (a, Int)
somaSegundos ((a,b):xs) = (a, (length ((a,b):xs)) * b)

comparaTempos [] = []
comparaTempos (x:xs) = somaSegundos x : comparaTempos xs

maxSec [] = 0
maxSec ((a,b):xs) | b >= maxSec xs = b
                  | otherwise = maxSec xs

mostHeard :: (Num a1, Ord a1) => [(a2, a1)] -> [(a2, a1)] -> [a2]
mostHeard _ [] = []
mostHeard lista ((a,b):xs) | (maxSec lista) == b = [a] ++ (mostHeard lista xs)
                           | otherwise = (mostHeard lista xs)