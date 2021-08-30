module Ex1_Question2 where

-- Cria em Haskell uma função "mdc" que recebe dois inteiros e calcula o máximo divisor comum deles.
mdc :: Int -> Int -> Int
mdc a b |a == 0 = b
        |a > 0 = mdc (mod b a) a
