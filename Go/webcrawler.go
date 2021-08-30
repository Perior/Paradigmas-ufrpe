package main

import (
  "crypto/tls"
  "flag"
  "fmt"
  "collectlinks"
  "net/http"
  "net/url"
  "os"
  "io/ioutil"
  "strings"
)
//termo a ser buscado
var term string

//mapa de paginas ja visitadas                
var visited = make(map[string]bool)  
                                     
                                                                          
func main() {
  flag.Parse()

  //verificacao dos argumentos do main (URL inicial e termo a ser buscado)	
  args := flag.Args()
  fmt.Println(args)
  if len(args) < 2 {
    fmt.Println("Por favor especifique a página inicial e o termo de pesquisa")
    os.Exit(1)
  } else if args[1] == "" {
  	fmt.Println("Por favor especifique o termo de pesquisa")
  	os.Exit(1)
  }
  
  term = args[1]

  // fila de URLs
  queue := make(chan string)
  
  	
  go func() { queue <- args[0] }()

  for uri := range queue {
    if !visited[uri] {
	   enqueue(uri, queue)
	}
  }
  
  fmt.Println("terminou")
}


//busca pelo termo na pagina e busca links para continuar a navegacao
func enqueue(uri string, queue chan string) {
  //fmt.Println("fetching", uri)
  visited[uri] = true                        
  
  
  transport := &http.Transport{
    TLSClientConfig: &tls.Config{
      InsecureSkipVerify: true,
    },
  }
  
  client := http.Client{Transport: transport}

  //busca de termo na pagina atual
  go searchTerm(uri,client)
  

  resp, err := client.Get(uri)
  if err != nil {
    return
  }
  defer resp.Body.Close()  	
  
  //busca os links na pagina atual e enfileira atraves do envio no canal 'queue'
  links := collectlinks.All(resp.Body) 
  
  for _, link := range links {
    absolute := fixUrl(link, uri)
    if uri != "" {
      if !visited[absolute] {          
        go func() { queue <- absolute }()
      }
    }
  }
}

//funcao para procurar se o termo existe na pagina 'uri'
func searchTerm(uri string, client http.Client) {

  resp, err := client.Get(uri)
  if err != nil {
    return
  }
  defer resp.Body.Close()  	
	
  html, errr := ioutil.ReadAll(resp.Body)
  if errr != nil {
	 panic(errr)
  }
  s:=string(html[:len(html)])
  if strings.Contains(strings.ToLower(s), strings.ToLower(term)) {
  	fmt.Printf("termo: %s existe em %s \n", term, uri)
  }
}

//conserta URLs com problemas
func fixUrl(href, base string) (string) {
  uri, err := url.Parse(href)
  if err != nil {
    return ""
  }
  baseUrl, err := url.Parse(base)
  if err != nil {
    return ""
  }
  uri = baseUrl.ResolveReference(uri)
  return uri.String()
}