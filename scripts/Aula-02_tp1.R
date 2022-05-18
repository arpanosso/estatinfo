# 1) Somatória e suas Propriedades
X <- c(1.78, 1.55, 1.72, 1.60)
Y <- c(22,19,21,19)
sum(X)
sum(Y)

### soma parcial
sum(X[2:3])

###
sum(X*Y)

#### soma multiplicação parcial
sum(X[1:3]*Y[1:3])
sum((X*Y)[1:3])


## Propriedades da Soma
### i) Soma de uma constante
k = 2
n = 374
374*2
vetor <- rep(k,n)
sum(vetor)

### ii) A soma de k multiplicada pela variável aleatória
k*sum(Y)
sum(k*Y)

### iii) Soma de duas variáveis aleatórias
sum(X+Y)
sum(X)+ sum(Y)

### APlicação das propriedades
sum(k*Y + k)
n <- 4
k*sum(Y)+n*k

round(sum(X - mean(X)))

#### Probabilidade
80*79*78/100/99/98
3*(80/100*20/99*79/98)
3*(20/100*19/99*80/98)


# 2) Métodos de Numeração e análise combinatória
## 2.1) Princípio da multiplicação
95^5/435e6
95^8/435e6/3600/24

## 2.2) Permutação
factorial(7)
factorial(6)
2*(factorial(5)*factorial(4)*factorial(3))
## 2.3) Arranjos
factorial(10)/factorial(10-6)
factorial(10)/factorial(10-4)
5^4
## 2.4) Combinações
choose(5,3)
choose(20,0)*choose(80,3)/choose(100,3)
dhyper(0,20,80,3)

choose(20,1)*choose(80,2)/choose(100,3)
dhyper(1,20,80,3)

choose(20,2)*choose(80,1)/choose(100,3)
dhyper(2,20,80,3)

choose(20,3)*choose(80,0)/choose(100,3)
dhyper(3,20,80,3)


N = 100 # Número total de elementos na população
M = 20 # número total de elementos de interesse (doentes) na população
r = 3 # tamanho da amostra.
x=0:r # os possiveis valores de doentes na amostra.
px<-dhyper(x,M,N-M,r) # função que faz a distribuição hipergeométrica
barplot(px,names=x,col="lightblue",las=1,ylim=c(0,0.65),
        xlab="nº de doentes na amostra",ylab="P(X=x)",main="X~Hgeo(20,100,3)")
text(1:length(x),px+.05,round(px*100,2))







X <- c(6,8,7)
sd(X)
n <- 3
sqrt(sum((X-mean(X))^2)/(n-1))

sum(X)
sum(X^2) # soma dos quadrados é diferente do
sum(X)^2 # quadrado da soma












