module Ex2_Question2 where

--Utilizando uma linguagem funcional como Haskell, defina uma função que ordena uma lista de listas de
--acordo com o tamanho das sublistas, isto é, listas pequenas primeiro, e listas longas no final. Por exemplo:
-- > ordenaLista [[1,3,5],[5,3],[8],[2,9,54,32,3],[2,34,5]]
-- > [[8],[5,3],[1,3,5],[2,34,5],[2,9,54,32,3]]

import Data.List (sort, sortBy)
import Data.Ord (comparing)

ordenaLista :: (Ord a) => [[a]] -> [[a]]
ordenaLista = sortBy (comparing(length))