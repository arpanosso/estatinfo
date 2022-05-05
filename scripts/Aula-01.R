# Lendo o Banco de dados
dados_turmas<-readr::read_rds("/data/dados_turmas.rds")

# Mostrando os 7 primeiro registros
head(dados_turmas, n=7)

# Caculando a Média de Idades
mean(dados_turmas$idade_anos)

# Construindo a distribuição de frequência da idade
hist(dados_turmas$idade_anos)

# 1
log(125,5)
sin(30*pi/180)
2*sin(45*pi/180)
1/sqrt(2*pi)
1/(2*pi)^(1/2)
1/(2*pi)**(.5)
1/sqrt(2*pi+1)
1/(sqrt(2*pi) +1 )

1/sqrt(2*pi) +1

# definindo o vetor numérico
X <- c(6, 8, 7)
X
X[3]
X[0]
sum(X)
mean(X)

#número de elementos (observações) do
#vetor
n <- length(X)
sum(X)^2/((n-1)*(n-2))
sd(X)
(sum((X-mean(X))^2)/2)^.5





