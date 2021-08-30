module Q2 where

{-
Crie um programa em Haskell que fica pedindo para o usuário digitar caminhos para arquivos 
até o usuário digitar uma linha vazia. Em seguida, seu programa deve concatenar o conteúdo de todos 
os arquivos informados na entrada em um único arquivo cujo nome também deve ser informado pelo usuário. 
-}

--Função principal de chamada.
mainMain :: IO()
mainMain =  do  writeFile "fileAux.txt" ""
                main


main :: IO()
main = do putStr "Digite um caminho para um arquivo(apenas enter para encerrar): "
          path <- getLine
          if(path /= "")
          then do arquivo <- readFile path
                  appendFile "fileAux.txt" arquivo
                  main
          else do putStr "Agora digite um caminho para o arquivo que vai receber os outros: "
                  filepath <- getLine
                  conteudo <- readFile "fileAux.txt"
                  writeFile filepath conteudo


