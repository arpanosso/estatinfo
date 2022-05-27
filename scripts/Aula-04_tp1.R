# Exemplo inicial
ni <- c(5,8,12,7,2)
sum(ni)
x <- seq(1.5,5.5,1)
fi <- ni/sum(ni)
# Média calculada pelo ponto médio de classe
# e a frequência relativa
sum(fi * x)

# Carregando pacotes
library(tidyverse)
library(readxl)

# Lendo o banco de dados no R
dados_turmas <- read_excel("C:\\Users\\Not. Unesp\\Downloads\\dados_turmas.xlsx")
# Resumo rápido dos dados
glimpse(dados_turmas)

# calculando a média de idade
mean(dados_turmas$idade_anos)

# ou
dados_turmas %>%
  pull(idade_anos) %>%
  mean()

# Média Ponderada
notas <- c(3.5, 5.5, 9)
pesos <- c(2,3,4)
weighted.mean(notas,pesos)

# Calculando as medianas
X <- c(3,1,5,7,23)
median(X)

Y <- c(30,31,33,31,30,28)
median(Y)

# tabela de frequência
x<-c(6, 7, 7, 8, 8, 8, 8, 8, 8, 9, 9, 10, 11, 12, 12, 12, 12, 12, 13, 13, 14)
table(x)
hist(x)

#
X3 <- c(0.6, 3.4, 9.8, 13.8, 17.4)
sum(X3) # Soma
var(X3) # variância
mean(X3) # média
sd(X3) # desvio padrão
sd(X3)/sqrt(5) # erro padrão da média

# Altura e idades
altura <- c(1.60, 1.78, 1.82, 1.86, 1.75, 1.89)
mean(altura)
sd(altura)
sd(altura)/mean(altura)*100 # CV da altura

idade <- c(19,19,20,19,20,20)
mean(idade)
sd(idade)
sd(idade)/mean(idade)*100 # CV da idade



















