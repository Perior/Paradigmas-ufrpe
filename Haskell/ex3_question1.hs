module Ex3_Question1 where

{-Em um sistema de RH uma pessoa é representada por nome, cpf e idade. Além disto, ela pode estar na categoria adulta (>18 anos) ou criança (<18 anos). 
 Por último, um adulto pode estar associado a uma lista contendo seus filhos (os quais podem ser crianças ou adultos). Crie tipos algébricos para representar estas estruturas. Em seguida defina duas funções: 
 a) crie uma função "ehFilho::Pessoa -> Pessoa -> Bool" que recebe duas pessoas e retorna True caso a segunda seja filho(a) da primeira e False caso contrário.
 b) crie uma função "mostraPessoa::Pessoa -> String" que recebe uma pessoa e retorna uma String contendo todas as suas informações (nome, cpf, idade, informações dos filhos)-}

type Nome = String
type Cpf = String
type Idade = Int
type TipoIdade = String
type Filhos = [Pessoa]

data Pessoa = Pessoa Nome Cpf Idade TipoIdade Filhos

-- Exemplo pra colocar no terminal: ehFilho (Pessoa "Arthur" "12234554365" 30 "adulto" [Pessoa "Bella" "76543887445" 10 "Crianca" [], Pessoa "Caio" "88877766654" 7 "Criança" []]) (Pessoa "Caio" "76543887445" 10 "Crianca" [])
-- Resposta letra a). Se a pessoa1 não tiver filhos já retorna false. Se for uma criança não tem como ter filhos
-- ou não deveria, no caso então será falso também. Se for um adulto e tiver criança(s) vai ser possivel dar true.
ehFilho :: Pessoa -> Pessoa -> Bool
ehFilho (Pessoa _ _ _ _ []) (Pessoa _ _ _ _ _) = False
ehFilho (Pessoa a b c d (x:xs)) (Pessoa p q r s t) | c >= 18 && (d == "Adulto" || d == "adulto") && elem p (getNome x) = True
                                                   | elem p (getNome x) == False = ehFilho (Pessoa a b c d xs) (Pessoa p q r s t)
                                                   | otherwise = False

-- Pega o primeiro elemento dos construtores.
getNome :: Pessoa -> [Nome]
getNome (Pessoa a _ _ _ _) = [a]

-- Resposta letra b)
-- E.g.: mostraPessoa (Pessoa "Arthur" "12234554365" 30 "adulto" [Pessoa "Bella" "76543887445" 10 "Crianca" [], Pessoa "Caio" "88877766654" 7 "Criança" []])
mostraPessoa :: Pessoa -> String
mostraPessoa (Pessoa a b c d e) = "Nome: " ++ a ++ "; CPF: " ++ b ++ "; Idade: " ++ show c ++ "; TipoIdade: " ++ d ++ "; Filhos: [" ++ mostraFilho e ++ "]"

-- Função auxiliar de mostraPessoa.
-- Faz o mesmo que mostraPessoa, mas com os filhos.
mostraFilho :: [Pessoa] -> String
mostraFilho [] = "Nenhum"
mostraFilho (x:xs) = mostraPessoa x ++ ", " ++ mostraFilho xs