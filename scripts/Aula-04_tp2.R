# Exercício inicial
ni <- c(5,8,12,7,2)
pm
c<-seq(1.5,5.5,1)
fi <- ni/sum(ni)
sum(pmc*fi)

# Carregando pacotes
library(tidyverse)
library(readxl)

# Lendo o banco de dados no R
dados_turmas <- read_excel("C:\\Users\\Not. Unesp\\Downloads\\dados_turmas.xlsx")

# Resumo rápido dos dados
glimpse(dados_turmas)

# Calcular média de Idade de alunos
mean(dados_turmas$idade_anos)
#ou
dados_turmas %>%
  pull(idade_anos) %>%
  mean()

# Média ponderada
notas <- c(5,9,2)
pesos <- c(3,2,5)
weighted.mean(notas,pesos)

# Mediana
X <- c(40,41,38,29,52)
median(X)

Y <- c(2,4,8,5,7,3)
median(Y)


R <- c(10,5,8,4,5,7)
mean(R)
median(R)

Rl <- c(100,5,8,4,5,7)
mean(Rl)
median(Rl)

# Amplitude
range(Rl)
diff(range(Rl))

# Soma dos Quadrados
x <- c(0.6, 3.4, 9.8, 13.8, 17.4)
sum(x)
mean(x)

sum((x-mean(x))^2)
sum(x^2) - sum(x)^2/5
var(x)

##
X <- c(3,5,8)
mean(X)
var(X)

# Sem usar as propriedades
Y <- X + 5
mean(Y)
var(Y)

Z <- 2*X
mean(Z)
var(Z)

# Desvio padrão
X3 <- c(0.6, 3.4, 9.8, 13.8, 17.4)
mean(X3)
var(X3)
sd(X3)

# Erro padrão da média
n <- length(X3)
sd(X3)/sqrt(n)

# Para X4
X4 <- c(0.6, 9, 9, 9, 17.4)
mean(X4)
var(X4)
sd(X4)
sd(X4)/sqrt(n)

# altura e idade, qual vaira mais?
altura <- c(1.7, 1.69, 1.83)
mean(altura)
sd(altura)
sd(altura)/mean(altura)*100

idade <- c(18,19,18)
mean(idade)
sd(idade)
sd(idade)/mean(idade)*100

# CV de X3 e X4
100*sd(X3)/mean(X3)
100*sd(X4)/mean(X4)




