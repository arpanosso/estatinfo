C = c(1, 1.1, 1.2, 1.3, 1.4)
pc = c(0.2, 0.3, 0.2, 0.2, 0.1)

#Distribuição
barplot(pc, names=C)

# Esperança de C
sum(C*pc)

# Variância de C
sum(C^2*pc) - sum(C*pc)^2

R = C*1.5 + 0.1

# Esperança de R
sum(R*pc)

# Variância de R
sum(R^2*pc) - sum(R*pc)^2

# Binomial
n = 3
p = 2/5
x = 0:n
px = dbinom(x,n,p)
barplot(px, names=x)
px

# Acumular as probs
pbinom(3,n,p)


6/5
18/25

# Distribuiçaõ de Poisson
lambda = 5
n = 15
exp(-lambda)*lambda^0/factorial(0)
# ou
dpois(0,lambda) + dpois(1,lambda) + dpois(2,lambda)
ppois(2,lambda)

x = 0:n

px <- dpois(x,lambda)
px
barplot(px, names=x)
1 - ppois(2,lambda)

# b
ppois(4,lambda*2)





























