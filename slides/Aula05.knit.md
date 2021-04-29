---
# Para transformar em PDF, usar: 
# pagedown::chrome_print("slides/Aula05.html")
# imagens https://www.pexels.com/pt-br/
# gifs https://giphy.com/
title: "Estatística e Informática"
subtitle: "Aula 05 - Medidas estatísticas"
author: "Alan Rodrigo Panosso <alan.panosso@unesp.br>"
institute: "Departamento de Engenharia e Ciências Exatas FCAV/UNESP"
date: "(13-05-2021)"
encoding: "UTF-8"
output:
  xaringan::moon_reader:
    lib_dir: libs
    nature:
      ratio: "16:9"
      highlightStyle: github
      highlightLines: true
      countIncrementalSlides: false
---


class: middle, center, inverse

# Medidas de Posição ou de Tendência Central

---
## Medidas de posição

São respostas breves e rápidas que sintetizam a informação não de uma forma de completa descrição dos dados ou eventual modelagem. 

Essas medidas, portanto, fornecem a posição na reta real, informa sobre a posição de um conjunto de dados. As Principais medidas são: 

1. Média:  
 - Aritmética
 - Ponderada
 - Geométrica (Apostila Apenas)
 - Harmônica (Apostila Apenas)

2. Mediana 

3. Moda

---
### Média populacional

Para a população, a média é definida como:

 $$
 \mu = \frac{\sum \limits_{i=1}^N x_i} {N}, com\; i=1,2,...,N.
 $$
 
 Onde $N$ é o tamanho da população. 

### Média amostral

 É a mais utilizada das medidas de posição. A média aritmética de um conjunto de $n$ observações da variável aleatória $X$, é o quociente da divisão por $n$ da soma dos valores das observações dessa variável. 
 
 $$
 \bar{x} = \frac{\sum \limits_{i=1}^nx_i} {n}, com\; i=1,2,...,n.
 $$
---

**Exemplo**: Para os dados de `altura` e `idade_anos`, da base de [Dados](https://arpanosso.github.io/estatinfo/data/dados_turmas.xlsx) da turma os valores de média.

### Carregando pacotes e a base


```r
library(readxl)
library(tidyverse)
dados_turmas <- read_excel("C:/Users/Usuario/Downloads/dados_turmas.xlsx")
View(dados_turmas)
```



<img src="https://arpanosso.github.io/estatinfo/slides/img/importa_r4.png" style=" display: block; margin-left: auto; margin-right: auto;width: 50%"></img>

---

### Cálculo da Média Aritmética

.pull-left[

$$
\bar{x} = \frac{\sum_{i=1}^nx_i}{n} = \frac{19+20+ \cdots+20}{49} = 20,9184\text{ anos} 
$$


```r
x<-dados_turmas$idade_anos
mean(x)
```

```
#> [1] 20.91837
```

### Cálculo da Média Aritmética pela Frequência Relativa

$\bar{x} = \sum_{i=1}^kf_ix_i$

$\bar{x} = 18(0,16)+19(0,28)+ \cdots + 49(0,02)$

$\bar{x} = 20,9184\;anos$

]

.pull-right[

Tabela de Frequência para Idade

<table>
 <thead>
  <tr>
   <th style="text-align:right;"> idade_anos </th>
   <th style="text-align:right;"> ni </th>
   <th style="text-align:right;"> fi </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 0.1632653 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 0.2857143 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.2244898 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.0612245 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 22 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.0612245 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 23 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 0.1224490 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 24 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.0204082 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.0204082 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 28 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.0204082 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 49 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.0204082 </td>
  </tr>
</tbody>
</table>
]

---

