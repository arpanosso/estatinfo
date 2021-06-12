### Breve Introdução

Considere uma população com $N$ objetos nos quais $M$ são classificados como do tipo $A$ e $N−M$ são classificados como do tipo $B$. Tomamos uma amostra ao acaso, sem reposição e não ordenada de $r$ objetos e seja $X$ a variável que conta o número de objetos classificados como do tipo $A$ na amostra. Então a distribuição de probabilidade de $X$ será dada por:


### Função de distribuição de Probabilidade:

$$P(X = x ) = \frac{ {M \choose x} \cdot {N-M \choose r-x} }{ {N \choose x} }$$

em que

$N$ é o tamanho da população;  
$M$ é o número de sucessos na população (tipo $A$);  
$r$ é o número de amostras sem reposição;  
$x$ é o número de sucessos observados.

### Esperança

$$E(X) = r \cdot \frac{M}{N}$$

### Variância

$$Var(X) = r \cdot \frac{M}{N} \cdot \frac{(N-M)}{N} \cdot \frac{N - r}{N-1} $$
