module Ex2_Question1 where

--Jon Snow precisa planejar seu ataque contra os exércitos da rainha Cersei. Para tanto, ele precisa calcular a força dos exércitos.
--Ele pediu a seu amigo Samwell Tarly para construir um programa em Haskell que receba uma lista de tuplas (String, Int), onde o primeiro argumento da tupla é o tipo de unidade e o segundo é a quantidade destas unidades e retorne o poder do exército. Cada unidade tem um poder de força: “soldado” – 2, “cavaleiro” – 10, “catapulta” – 30 e “dragão” – 100. Desta forma, ajude Samwell e desenvolva um programa que dado um exército (lista de tuplas (String,Int)) retorne seu poder (soma dos poderes de cada unidade no exército – força*quantidade).
--Por exemplo: calculaForca [("soldado",50),("catapulta",5),("cavaleiro",10),("dragão",2)] = 2*50+30*5+10*10+100*2= 550

calculaForca :: [(String, Int)] -> Int
calculaForca [] = 0
calculaForca (x:xs) = forcaUnidade x + calculaForca xs

forcaUnidade :: (String, Int) -> Int
forcaUnidade (a,b) | a == "soldado" = 2*b
                   | a == "Soldado" = 2*b
                   | a == "catapulta" = 30*b
                   | a == "Catapulta" = 30*b
                   | a == "cavaleiro" = 10*b
                   | a == "Cavaleiro" = 10*b
                   | a == "dragão" = 100*b
                   | a == "Dragão" = 100*b
                   | a == "dragao" = 100*b
                   | a == "Dragao" = 100*b 
                   |otherwise = 0