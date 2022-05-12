# Somatória e suas Propriedades
X <- c(1.6, 1.8, 1.8, 1.75, 1.72)
Y <- c(19, 22, 19, 20, 18)

# somas simples
sum(X)
sum(Y)

# soma parcial
sum(Y[2:4])

# soma do produto
sum(X*Y)

# Soma dos quadrados é diferente do quadrado da soma
sum(Y^2)
sum(Y)^2

# Propriedade da Soma
# Soma de uma constante k
k <- 3
n <- 5
vetor <- rep(k,n)
sum(vetor)
n*k

# Soma da v.a. multiplica pela constante
# SOMA {k * X}
3*sum(X)
sum(X*k)

# Soma de duas variáveis aleatórias
sum(X+Y)
sum(X)+sum(Y)

# Combinação simples
sum(k*X+k)
k*sum(X)+n*k

# Soma de X menos a média de X
xb <- mean(X)
round(sum(X-xb))
round(sum(Y-mean(Y)))

# Gerando 100 valores aleatórios
Z <- rnorm(100)
round(sum(Z-mean(Z)))


# Provavilidade
3*(20*79*80/100/99/98)
3*(20/100*19/99*80/98)
20*19*18/100/99/98

##
95^5/435e6
95^9/435e6/3600/24/365


# Fatorial
factorial(7)
2*factorial(5)*factorial(4)*factorial(3)

# combinação no R
choose(20,0)*choose(80,3)/choose(100,3)
choose(20,1)*choose(80,2)/choose(100,3)
choose(20,2)*choose(80,1)/choose(100,3)
choose(20,3)*choose(80,0)/choose(100,3)

# Código da Hipergeométrica
N = 100 # Número total de elementos na população
M = 20 # número total de elementos de interesse (doentes) na população
r = 3 # tamanho da amostra.
x=0:r # os possiveis valores de doentes na amostra.
px<-dhyper(x,M,N-M,r) # função que faz a distribuição hipergeométrica
barplot(px,names=x,col="lightblue",las=1,ylim=c(0,0.65),
        xlab="nº de doentes na amostra",ylab="P(X=x)",main="X~Hgeo(20,100,3)")
text(1:length(x),px+.05,round(px*100,2))


















