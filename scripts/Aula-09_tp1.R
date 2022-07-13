# Distribuição de Probabilidade de Variáveis
# Contínuas.

X <- c(1.73, 1.93, 1.78, 1.60, 1.70)
mean(X)
sd(X)

# Padronização
Z = (X - mean(X))/sd(X)
round(mean(Z))
sd(Z)


pnorm(1.73) - 0.5
1-pnorm(1.73)
pnorm(-1.73)
pnorm(1.73) - pnorm(0.47)
pnorm(1.73) - pnorm(-0.47)
pnorm(-0.47)*2

170+5*qnorm(.8)












