<p align="center">
<a href= "https://img.shields.io/github/repo-size/felipebacelo/MyNetflixHistory?style=for-the-badge"><img src="https://img.shields.io/github/repo-size/felipebacelo/MyNetflixHistory?style=for-the-badge"/></a>
<a href= "https://img.shields.io/github/languages/count/felipebacelo/MyNetflixHistory?style=for-the-badge"><img src="https://img.shields.io/github/languages/count/felipebacelo/MyNetflixHistory?style=for-the-badge"/></a>
<a href= "https://img.shields.io/github/forks/felipebacelo/MyNetflixHistory?style=for-the-badge"><img src="https://img.shields.io/github/forks/felipebacelo/MyNetflixHistory?style=for-the-badge"/></a>
<a href= "https://img.shields.io/bitbucket/pr-raw/felipebacelo/MyNetflixHistory?style=for-the-badge"><img src="https://img.shields.io/bitbucket/pr-raw/felipebacelo/MyNetflixHistory?style=for-the-badge"/></a>
<a href= "https://img.shields.io/bitbucket/issues/felipebacelo/MyNetflixHistory?style=for-the-badge"><img src="https://img.shields.io/bitbucket/issues/felipebacelo/MyNetflixHistory?style=for-the-badge"/></a>
</p>

# Análise de Histórico Netflix

## Objetivo ##

<p>Contribuir com um trabalho analítico extraindo informações e storytelling baseados em dados para insights bem como, uma forma de desenvolver e consolidar meus conhecimentos no campo da análise de dados desenvolvendo uma análise descritiva com o uso da linguagem de programação R através da IDE RStudio.</p>

## Origem dos Dados ##

<p>O arquivo que contém a base dos dados está em formato CSV.</p>
<p>Os arquivos CSV são amplamente utilizados e poussuem características como, separados por quebras de linha, sendo que cada registro permanece numa única linha do arquivo e cada registro possui um ou mais campos, separados por um delimitador, os mais comuns sendo a vírgula <strong>","</strong> e o ponto e vírgula <strong>";"</strong>.</p>
<p>Para realizar o download do arquivo CSV com os dados, basta seguir os seguintes passos:</p>

* Realizar login no site da Netflix: https://www.netflix.com, escolhendo o perfil para o qual deseja baixar os dados;
* Entrar na página: https://www.netflix.com/viewingactivity;
* Clicar em <strong>Download all</strong>, ao final da página.

## Instalação das Ferramentas ##
  
  - [R - 4.1.0](https://www.r-project.org/)
  - [RSudio - 1.4.1725](https://rstudio.com/)

## Desenvolvimento ##

### Leitura da Base ###

<p>O arquivo que contém a base dos dados está em formato CSV e possui duas colunas:</p>

* A coluna <strong>Title</strong> contém informação sobre o nome do filme ou da série e, se for uma série, também a temporada e o episódio.
* A coluna <strong>Date</strong> contém o dia, mês e ano em que o título foi assistido, sem informação da hora.

Sempre ao assistir qualquer título, uma nova linha é gerada na base, independentemente se assistimos até o final.

### Manipulação dos Dados ###

<p>Através da manipulação dos dados da base original conseguimos gerar mais informações necessárias, criando algumas colunas com base nas existentes.</p>
<p>Dependendo do idioma que você configurou na Netflix, a data pode vir num formato diferente, para corrigirmos isto, criamos a função <strong>parse_data</strong>.</p>
<p>À princípio, não temos informação sobre a categoria (filme, série, documentário etc). No entanto, supondo que séries sempre terão padrões do tipo episódio <strong>":"</strong> na coluna Title, podemos criar a coluna categoria para separar as séries dos filmes/documentários.</p>
<p>A coluna mes_ano é a coluna Date com o dia do mês sempre igual a 1, isso facilita a agregação da base por mês.</p>
<p>A construção da coluna programa, no caso das séries, supõe que tudo o que aparece depois do <strong>":"</strong> nos nomes dos títulos é informação sobre temporada e episódio. Assim, removendo essa informação, podemos contar quantas vezes assistimos cada série, independentemente do episódio.</p>
<p>Através dessas manipulações teremos criado as seguintes colunas a partir da base original:</p>

* mês;
* ano;
* dia_sem;
* categoria;
* mes_ano;
* programa.

### Visualizações ###

<p>Inicialmente, fiz um gráfico para visualizar a série temporal do número de títulos assistidos ao longo do tempo. Entre um pico de visualização e outro, a minha frequência foi mais ou menos constante ao longo dos anos, com exceção no segundo semestre de 2020 e no primeiro semestre de 2021, cujo crescimento coincide com o período da pandemia.</p>
<p align="center">
<img src="https://github.com/felipebacelo/MyNetflixHistory/blob/main/IMAGES/PLOT-1.png"/></p>
<p>Para visualizar quais meses do ano eu mais assisto Netflix, fiz um gráfico da média de títulos assistidos por mês no ano. Os meses de julho, agosto e dezembro são os que eu mais assisti Netflix, talvez pelo fato das férias letivas.</p>
<p align="center">
<img src="https://github.com/felipebacelo/MyNetflixHistory/blob/main/IMAGES/PLOT-2.png"/></p>
<p>Fiz também o gráfico por ano, contando o número de programas assistidos por ano. 2020 foi o grande destaque.</p>
<p align="center">
<img src="https://github.com/felipebacelo/MyNetflixHistory/blob/main/IMAGES/PLOT-3.png"/></p>
<p>Analisando agora o dia da semana, sem nenhuma surpresa, os fins de semana ganham, principalmente o domingo.</p>
<p align="center">
<img src="https://github.com/felipebacelo/MyNetflixHistory/blob/main/IMAGES/PLOT-4.png"/></p>
<p>Por fim, contei as séries que mais assisti. O resultado representa bem o meu gosto por gêneros de ação, história e aventura.</p>
<p align="center">
<img src="https://github.com/felipebacelo/MyNetflixHistory/blob/main/IMAGES/PLOT-5.png"/></p>

## Referências ##
  
* [Curso-R](https://curso-r.com/)
* [R para Data Science](https://curso-r.com/)

## Licenças ##

_MIT License_
_Copyright   ©   2021 Felipe Bacelo Rodrigues_
