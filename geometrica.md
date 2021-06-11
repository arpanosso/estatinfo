### Breve Introdução

É formada por duas funções de probabilidade discretas:

**1)** A distribuição de probabilidade do número $X$ de tentativas de *Bernoulli* necessárias para alcançar $01$ sucesso, suportadas pelo conjunto $\{ 1, 2, 3, \cdots \}$ ou.

**2)** A distribuição de probabilidade do número $Y = X − 1$ de fracassos antes do primeiro sucesso, suportadas pelo conjunto $\{ 0, 1, 2, 3, \cdots \}$.

### Função de distribuição de Probabilidade:

Se a probabilidade de sucesso de cada tentativa é $p$, então a probabilidade de $n$ tentativas serem necessárias para ocorrer um sucesso é:

$$P(X=n) = (1-p)^{n-1} \cdot p$$

para $n = 1,2,3, \cdots$ de forma análoga, a probabilidade de serem necessários $n$ insucessos antes do primeiro sucesso é:

$$P(Y = n) = (1-p)^n \cdot p$$

para $n = 0, 1, 2, 3, \cdots$ .
onde: 

$n$: é o número de tentativas antes do primeiro sucesso.  
$p$: é a probabilidade de sucesso.
$q$: é a probabilidade de fracasso dado por $(1-p)$.

Para a variável $X \sim$ número de tentativas $n$ antes do sucesso:

### Esperança de $X$ e Variância de $X$

$$E(X) = \frac{1}{p} \text{ e } Var(X) = \frac{1-p}{p^2}$$

Para a variável $Y \sim$ o número de fracassos antes do primeiro sucesso:

### Esperança de $Y$ e Variância de $Y$

$$E(Y) = \frac{(1-p)}{p} \text{ e } Var(Y) = \frac{(1-p)}{p^2}$$
