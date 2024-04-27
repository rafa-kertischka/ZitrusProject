## Testes Gherkins (desafio 1), Testes para o site Zitrus (desafio 2) e Testes para à API GitHub (desafio 3):

Esses casos de teste em Gherkin são escritos em arquivos e com recursos do Robot Framework. 
O Robot Framework é uma estrutura de automação de teste que suporta a execução de testes baseados em palavras-chave, o que torna a escrita dos casos de teste bastante legível e compreensível. Por conta desses e vários outros fatores utilizei essa ferramenta maravilhosa (open source) para realização dos desafios.

- Desafio 1: os teste são genéricos, testam à funcionalidade de login com credenciais válidas e inválidas, além de verificar a funcionalidade de recuperação de senha.
- Desafio 2: os testes são simples, o primeiro cenário verifica se a página inicial carrega corretamente e o segundo verifica se o botão "Contato" funciona corretamente.
- Desafio 3: os testes são organizados em casos de teste separados, onde cada caso de teste é responsável por realizar uma operação específica na API do GitHub. 

## Pré-requisitos:

- Python (3.12.3)
- Robot Framework
- Robot Framework SeleniumLibrary
- Robot Framework RequestsLibrary
- WebDriver para o navegador de sua escolha (por exemplo, ChromeDriver para o Google Chrome)

## Configuração do Ambiente

1. Clone este repositório:
- git clone https://github.com/rafa-kertischka/ZitrusProject.git
2. Instale as dependências:
- pip install -r requirements.txt
3. Certifique-se de ter o WebDriver adequado instalado e adicionado ao seu PATH do sistema.

## Executando os Testes

Para executar os testes, use o seguinte comando:
- robot nome_do_arquivo.robot

## Observações importantes: 
- lembre-se de substituir o browser nos arquivos de acordo com a sua escolha configurada (WebDriver) 
- no comando de execução substituir o "nome_do_arquivo" pelo Desafio 2 ou Desafio 3
- obtenha um token de acesso pessoal do GitHub para os testes do desafio 3 (https://github.com/settings/tokens)
- certifique-se de substituir os dados das váriaveis de acordo com seus dados (Git/Token/etc) no desafio 3
