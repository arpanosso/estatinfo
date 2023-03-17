# Aula 01 - Data 16/03/2023
# Estatística e Informática

2/(3*4*5) # expressão numérica
2/3/4/5 # é a mesma expressão

# Exemplo Identação
if(media >= 5){
print("Aluno Passou")
print("Até a próxima")
} else {
print("Aluno Reprovou")
print("faça a recuperação, vai da bom")
}

#Identado
if(media >= 5){
  print("Aluno Passou")
  print("Até a próxima")
} else {
  print("Aluno Reprovou")
  print("faça a recuperação, vai da bom")
  if(media >= 3){
    print("Recuperação, com certeza")
  }else{
    print("Nos vemos no próximo semestre")
  }
}

# minha-media -------------------------------------------------------------
# entrada
num1 <- 8
num2 <- 10
soma <- 0; media <- 0

# Processamento
soma <- num1+ num2
media <- soma/2

# Saida
cat("A média é: ",media )


# classificar-média -------------------------------------------------------
# Dada a média do aluno, exibir se
# o aluno está aprovado ou reprovado
# Entrada
media <- 4.99
nome <- "Alan"
# Processamento
if(round(media,1) >= 5) { # chaves criam blocos
  cat("Aluno(a) aprovado(a)", nome) # saída
}else{
  cat("Aluno(a) reprovado(a)", nome)
}


# exemplo-iteração --------------------------------------------------------
contador <- 0
while(contador < 10){
  cat("Bom dia turma...", contador,"\n")
  contador <- contador + 1
}


# negativo-positivo -------------------------------------------------------
for(i in 1:10){
  print(i*(-1)^i)
}


# media-ponderada ----------------------------------------------------------
# Entrada
nota1 <- 5
nota2 <- 6
peso1 <- 6
peso2 <- 4
media <- 0

# Processamento
media <- (nota1*peso1 + nota2*peso2)/(peso1+peso2)

# Saída
cat("A média ponderada é: ", media)


# chatGPT-salario-reajuste ------------------------------------------------
# Definir o valor inicial do salário
salario_inicial <- 3000

# Calcular o valor do reajuste em 7.75%
reajuste <- salario_inicial * 0.0775

# Calcular o novo valor do salário após o reajuste
salario_novo <- salario_inicial + reajuste

# Exibir os resultados
cat("O salário inicial era de R$", salario_inicial, "\n")
cat("O reajuste de 7.75% é de R$", reajuste, "\n")
cat("O novo salário após o reajuste é de R$", salario_novo, "\n")









