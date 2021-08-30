module Q3 where

{-
Utilizando a linguagem funcional Haskell, defina uma função bag que recebe uma lista de elementos 
e retorna uma lista de pares, onde o primeiro elemento de cada par é um elemento da lista original 
e o segundo é o número de ocorrências deste elemento. Nesta segunda lista, cada elemento só ocorre uma vez. 
Por exemplo, bag [a,b,a,c,a,b] = [(a,3),(b,2),(c,1)]. 
-}


import Data.List
--group & sort vão separar a lista por similaridade.
--Ex: "Mississipi" -> [[M][i,i,i,i][s,s,s,s][p]]
--A função vai dar o length em cada subString e map junta tudo em tuplas.

bag :: Ord a => [a] -> [([a], Int)]
bag lista = map (\x -> ([head x], length x)) . group . sort $ lista