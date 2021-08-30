module Ex1_Question1 where

-- Questão 1:

--Assuma que seu arquivo possui uma função "gols::(Int,String) -> Int" que mapeia os jogadores de um clube
-- para a quantidade de gols que eles fizeram na temporada. A tupla de entrada é composta pelo número do jogador,
-- os quais vão em ordem crescente de 1 a 11, e seu respectivo nome. 
--Abaixo segue um exemplo, que pode ser utilizado:
--gols (1, "Navas") = 0
--gols (2, "Thiago Silva") = 0
--gols (3, "Kimpembe") = 0
--gols (4, "Kehrer") = 1
--gols (5, "Marquinhos") = 3
--gols (6, "Verratti") = 0
--gols (7, "Mbappé") = 18
--gols (8, "Paredes") = 0
--gols (9, "Icardi") = 12
--gols (10, "Neymar") = 13
--gols (11, "Di Maria") = 8
--Assim, baseado no que está especificado na função "gols", crie duas funções,
-- uma que retornar o nome do artilheiro (o jogador que fez mais gols) nesta temporada e outra que retorna
-- o total de gols do clube na temporada. 

gols :: (Int, String) -> Int
gols (1, "Navas") = 0
gols (2, "Thiago Silva") = 0
gols (3, "Kimpembe") = 0
gols (4, "Kehrer") = 1
gols (5, "Marquinhos") = 3
gols (6, "Verratti") = 0
gols (7, "Mbappe") = 18
gols (8, "Paredes") = 0
gols (9, "Icardi") = 12
gols (10, "Neymar") = 13
gols (11, "Di Maria") = 8

--Função auxiliar de entrada para as funções Soma e Artilheiro
--Quando for chamar a função no terminal usar ela como entrada :) Ex.: artilheiro time/soma time
time :: [(Int, String)]
time = [(1, "Navas"), (2, "Thiago Silva"), (3, "Kimpembe"), (4, "Kehrer"), (5, "Marquinhos"), (6, "Verratti"), (7, "Mbappe"), (8, "Paredes"), (9, "Icardi"), (10, "Neymar"), (11, "Di Maria")]

--Letra b) da questão
--Só soma todos os pontos do time
soma :: [(Int, String)] -> Int
soma [] = 0
soma (x:xs) = gols x + soma xs

--Compara recursivamente a maior pontuação da temporada
maisGols :: [(Int, String)] -> Int
maisGols [] = 0
maisGols (x:xs) |gols x >= maisGols xs = gols x
                |otherwise = maisGols xs

--Letra a) da questão
--Para os casos onde dois ou mais jogadores tiveram a mesma pontuação máxima,
--essa função retorna uma lista com esses jogadores. Fica mais organizado que retornar as strings "soltas"
--Se ninguem pontuou na temporada a função retorna a String ali embaixo
artilheiro :: [(Int, String)] -> [String]
artilheiro [] = []
artilheiro (x:xs) |maisGols time == 0 = ["Nenhum jogador pontuou nessa temporada"]
                  |maisGols time /= gols x = artilheiro xs
                  |otherwise = [snd x] ++ artilheiro xs

                  







