# Distribuição de Probabilidade de Variáveis
# Contínuas.

x <- c(1.7,1.78,1.75, 1.73)
mean(x)
sd(x)

# Padronizando
z = (x-mean(x))/sd(x)

mean(z)
sd(z)

# ÀREA DE NORMAL PADRÃO NO R É ACUMULADA ATÉ
# O VALOR ZE
#a
pnorm(1.73) - 0.5

# b
1- pnorm(1.73)

#d
pnorm(1.73)

# e
pnorm(1.73) - pnorm(0.47)

# f
pnorm(1.73) - pnorm(-0.47)

# g
1-(pnorm(0.47) - pnorm(-0.47))


#
1- pnorm(-1)


#
pnorm(174.212,170,5)
qnorm(0.8,170,5)







