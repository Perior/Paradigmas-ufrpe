module Ex3_Question2 where

{- Filamentos de DNA e RNA são compostos por seus nucleotoides. 
 Os quatro nucleotoides do DNA são: adenina (A), citosina (C), guanina (G) e timina (T).
 Os quatro nucleotoides do RNA são: adenina (A), citosina (C), guanina (G) e uracil (U).
 Um filamento de DNA pode ser transcrito para um de RNA substituindo cada nucleotoide pelo seu complemento:

G -> C
C -> G
T -> A
A -> U

Assim, crie um programa em haskell que lê um arquivo "dna.txt" cujas linhas correspondem a filamentos de DNA. Em seguida, crie um novo arquivo "rna.txt" com as transcrições para RNA dos filamentos fornecidos no arquivo de entrada. Abaixo segue um exemplo.
Dado um arquivo "dna.txt" com o seguinte conteúdo:
ACGTGGTCTTAA
CGTA
Seu programa deve gerar um arquivo "rna.txt" com o seguinte conteúdo:
UGCACCAGAAUU
GCAU
Linhas em branco devem gerar linhas em branco no arquivo de saída. Caso existam caracteres inválidos nas linhas do arquivo de entrada, a linha correspondente no arquivo de saída deve informar uma mensagem de erro "Filamento de DNA inválido!".-}



-- Função principal a ser chamada.
rnaShow :: IO ()
rnaShow = do    x <- readFile "dna.txt"
                writeFile "rna.txt" (transcricaoDNA x)

-- lines transforma uma String em uma [String], onde a quebra de linhas delimita a separação.
-- Unlines desfaz isso =)

transcricaoDNA :: String -> String
transcricaoDNA s = unlines (invalidException(lines (map argMapRNA s)))

argMapRNA :: Char -> Char
argMapRNA a | a == 'G' || a == 'g' = 'C'
            | a == 'C' || a == 'c' = 'G'
            | a == 'T' || a == 't' = 'A'
            | a == 'A' || a == 'a' = 'U'
            | a == '\n' = '\n'
            | otherwise = '#'

-- Substitui as linhas com # (qualquer valor indesejado no arquivo é transformado em #) pela mensagem de erro.
invalidException :: [String] -> [String]
invalidException [] = []
invalidException (x:xs) | elem '#' x = "Filamento de DNA invalido!" : invalidException xs
                        | otherwise = x : invalidException xs