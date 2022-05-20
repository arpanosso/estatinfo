# Vamos carregar o pacote tidyverse no
# ambiente
library(tidyverse)

# Importanto o data set do excel
# não pode ter Enter ou outros caracteres no caminho
library(readxl)
dados_turmas <- read_excel("C:/Users/Not. Unesp/Downloads/dados_turmas.xlsx")

# Buscar o tamanho da amostra (n)
glimpse(dados_turmas)
n <- nrow(dados_turmas)

# Contar as categorais da variavel sexo
summarise(group_by(dados_turmas, sexo),ni=n())

# vamos escrever usando o PIPE
# SEXO
dados_turmas %>% # Control+Shift+M"
  group_by(sexo) %>%
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # freq relativa
         perc = fi*100) # procentagem de frequencia

#COR DO CABELO
dados_turmas %>% # Control+Shift+M"
  group_by(cor_cabelo) %>%
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # freq relativa
         perc = fi*100) # procentagem de frequencia

#Grau de Alcoolismo
dados_turmas %>% # Control+Shift+M"
  group_by(GA) %>%
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # freq relativa
         perc = fi*100) # procentagem de frequencia



# Gráficos (Visualização dos dados)
dados_turmas %>% # Control+Shift+M"
  group_by(GA) %>%
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # freq relativa
         perc = fi*100) %>% # procentagem de frequencia
ggplot(aes(x=GA, y=perc)) +# apenas fez a área de plotagem
  geom_col(color="red",
           fill ="orange") # criando o gráfico de colunas

dados_turmas %>% # Control+Shift+M"
  group_by(GA) %>%
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # freq relativa
         perc = fi*100) %>% # procentagem de frequencia
  ggplot(aes(x=GA, y=perc,
             fill=GA)) +# apenas fez a área de plotagem
  geom_col(color="red") # criando o gráfico de colunas


# alteram x por y
dados_turmas %>% # Control+Shift+M"
  group_by(GA) %>%
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # freq relativa
         perc = fi*100) %>% # procentagem de frequencia
  ggplot(aes(x=fi, y=GA,
             fill=GA)) +# apenas fez a área de plotagem
  geom_col(color="red") # criando o gráfico de colunas


# Gráfico de Setores
dados_turmas %>% # Control+Shift+M"
  group_by(GA) %>%
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # freq relativa
         perc = fi*100) %>%
  ggplot(aes(x="",y=perc, fill=GA)) + # codigo para fazer os setores
  geom_bar(stat="identity") +
  coord_polar("y", start=0) +
  theme_void()

# Gráfico de setores
dados_turmas %>% # Control+Shift+M"
  group_by(GA) %>%
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # freq relativa
         perc = fi*100) %>%
  ggplot(aes(x="",y=fi, fill=GA)) +
  geom_bar(stat="identity") +
  coord_polar("y", start=0) +
  theme_void() +
  geom_text(
    aes(
      label=paste0(round(perc), "%")),
    position=position_stack(vjust = 0.5))

##Visualização de variáveis Quantitativas
## Importância da média  como a soma de cada observação
## multiplica pela sua respectiva frequencia relativa
## probabilidade.
idades <- 18:20
ni <- c(5,7,4)

x <- rep(idades,ni)
mean(x)

fi <- ni/16
sum(idades*fi)
mean(x)

# Visualizar os valroes de idades dos ALUNOS
# Idade em anos
dados_turmas %>% # Control+Shift+M"
  group_by(idade_anos) %>%
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # freq relativa
         perc = fi*100) # procentagem de frequencia

# Boxplot com as idades
dados_turmas %>% # banco de dados
  ggplot(aes(y=idade_anos)) + # gráfico do ggplot
  geom_boxplot() # é o tipo de gráfico


# Boxplot com as altura, box deitado
dados_turmas %>% # banco de dados
  ggplot(aes(x=altura)) + # gráfico do ggplot
  geom_boxplot() # é o tipo de gráfico

# vamos buscar o máximo da altura
dados_turmas %>%
  pull(altura)  %>% # pegando a variável para fazer calculo
  max()

dados_turmas %>%
  pull(altura)  %>% # pegando a variável para fazer calculo
  min()


# Tabela de Frequencia
dados_turmas %>%
  mutate(
    classes_altura = cut(altura,5)
  ) %>%
  group_by(classes_altura) %>%
  summarise(ni=n()) %>%
  mutate(fi = ni/sum(ni),
         perc = fi*100)

dados_turmas %>%
  pull(altura) %>%
  median()













