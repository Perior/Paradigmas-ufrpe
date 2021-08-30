module Q1 where

--Um player de músicas digitais precisa ranquear as músicas de acordo com os seus nomes. O ranking
--de cada música consiste na soma dos valores de cada caractere alfabético do nome de acordo com seus
--valores na tabela ASCII. Por exemplo, “olhar 43” deve retornar 111(o) + 108(l) + 104(h) + 97(a) + 114(r) = 534.
--Desta forma, crie um programa em Haskell que dada uma lista de strings (lista com nomes das músicas)
--retorne uma lista com os rankings de cada uma das músicas descritas na lista de entrada.
--OBS: Lembre-se que as funções isAlpha e ord já estão disponíveis, onde a primeira retorna um booleano True caso
--o caractere passado como parâmetro seja alfabético e False caso contrario, enquanto que a segunda retorna o valor
--ordinal de um caractere de acordo com a tabela ASCII.
import Data.Char

principal::[String] -> [Int]
principal [] = []                                               -- função principal onde deve ser inserido a lista com o nome das musicas, e irá retornar o rank delas
principal (x:xs) = rankMusica(filter isAlpha x):principal (xs)  -- essa função irá chamar a função "rankMusica" filtrando os caracteres da cabeça da lista
-- e concatenando com a sua função recursiva

rankMusica::String -> Int
rankMusica s = foldl1 (+) (map (ord) (s)) -- a função "rankMusica" irá receber a String(ja filtrada os caracteres) e irá fazer o somatório da lista de inteiros após o uso da função "ord"