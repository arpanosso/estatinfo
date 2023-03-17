# Aula 01 - 16/03/2023
# Estatística e Informática
# Algoritmos


# minha-média -------------------------------------------------------------
# Entrada de dados
num1 <- 5
num2 <- 6
media <- 0

# Processamento
media <- (num1+num2)/2

#Saída
cat("Média = ", media)


# classificar-média -------------------------------------------------------
# Dado o valor de média de um aluno,
# e o seu Nome, classificar
# em aprovado se a média for maior ou
# igual a 5, caso contrário, reprovado
# Entrada
nome <- "Pedro"
media <- 4.99

# Processamento
if(round(media, 1) >= 5){ # definem blocos de instruções
  cat(nome, " aprovado(a)")
}else{
  cat(nome, " reprovado(a)")
}

# imprime-1-10 ------------------------------------------------------------
for(contador in 1:10){
  cat(contador, "\n")
}


# loop-infinito -----------------------------------------------------------
i <- 0
while(i < 10){
  print("Boa tarde...")
  i <- i+1
}


# negativo-positivo -------------------------------------------------------
i <- 0
for(i in 1:10){
  print(i*(-1)^i )

}

# media-poderada ----------------------------------------------------------
nota1 <- 3
nota2 <- 10
media <- 0
media <- (nota1*6 + nota2*4)/(6+4)
cat("Média ponderada = ", media)


# meses-maiusculo ----------------------------------------------------------
month.name # constante no R

stringr::str_to_upper(month.name)
# stringr é o nome de um pacote
# str_to_upper é a função que passará todas
# as letras do objeto "month.name"



































