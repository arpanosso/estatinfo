# Exercício 01 - Custo de Antibióticos
C <- c(1, 1.1, 1.2, 1.3,1.4) # seq(1,1.4,0.1)
pc <- c(0.2, 0.3, 0.2, 0.2, 0.1)
sum(pc)

# Esperanção matemática - média da distribuição de probabilidade
sum(C*pc)

# Variância da distrbuiçãod e probabilidade
sum(C^2*pc) - sum(C*pc)^2

# item b

R <- 1.5*C+0.1
R
# Esperanca de R
sum(R*pc)

# Variancia de R
sum(R^2*pc) - sum(R*pc)^2
# Binomial no r
n <- 3
p <- 2/5
x <- 0:n
px<-dbinom(x,n,p)
barplot(px, names=x)
px

# Esperança
n*p

# Variancia
n*p*(1-p)

## Usamos a soma das probabilidade
n <- 6
p <- 0.5
pbinom(3,n,p) # soma até um valor as probabilidades
# Poisson
lambda = 2
x = 4
exp(-lambda)*lambda^x/factorial(x)
# ou
dpois(x,lambda)
lambda = 2
n = 10
x <- 0:n
px<- dpois(x,lambda)
barplot(px, names=x)

# exercicio 2, particulas alpha
lambda = 5
1-ppois(2,lambda)

# item b
lambda_novo = lambda*2
ppois(4, lambda_novo)









