module Q2 where

--Escreva a funcao ocorreUma :: [Int] -> [Int]  em Haskell, que deve retornar uma lista com
--os números inteiros que aparecem apenas uma vez na lista passada como parâmetro.
--Ex: ocorreUma [4,1,5,4,3,5]  deve retornar [1,3] .

ocorreUma::[Int]->[Int]
ocorreUma [] = []
ocorreUma lista = decide lista lista --  função principal que só faz chamar outra função passando os parametros passados


varre::Int->[Int]->Int  -- função onde eu forneço um inteiro e a lista e ele me retorna quantas vezes o inteiro apareceu naquela lista
varre _ [] = 0
varre num lista | num == head(lista) = (1+(varre num (tail lista))) -- verifica se o numero fornecido está na cabeça da lista, se tiver incrementa 1 no valor de vezes na lista e chama a função passando esse mesmo valor e a calda
                | otherwise = (varre num (tail lista)) -- caso não seja igual, passa o numero em analise e a calda da lista


decide::[Int]->[Int]->[Int] -- função onde recebe 2 listas de inteiros e retorna outra lista
decide [] n = []
decide lista listaFixa | varre (head(lista)) listaFixa == 1 = head(lista):decide(tail(lista)) listaFixa -- função que decide se o valor da lista vai permanecer na lista de retorno, caso só apareça 1 vez na lista concateno o valor com a recursão da função
                       | otherwise = decide(tail(lista)) listaFixa -- caso contrario o valor não entra na lista de retorno e chama a função recursivamente