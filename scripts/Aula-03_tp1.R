# Vamos aprender a instalar pacotes no R
# Instalar o tidyverse
mutate # com o pacote não está no ambiente, ele não reconhece essa função

# carregar o pacote no ambiente de trabalho
library(tidyverse)
mutate

## Carregar o banco de dados
library(readxl)
dados_turmas <- read_excel("C:/Users/Not. Unesp/Downloads/dados_turmas.xlsx")

### Resumo rápido do data set
glimpse(dados_turmas)
n <- nrow(dados_turmas)

### Contagem das categorias de sexo
summarise(group_by(dados_turmas,sexo), ni = n())

### vamos contar usando a abordagem tidy
### PIPE LINE
# Sexo
dados_turmas %>% # Pipe Control + Shift + M
group_by(sexo) %>% # agrupando por sexo
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # calculado a freq relativa
         perc = fi*100) # porcentagem de frequência

# Cor de cabelo
dados_turmas %>% # Pipe Control + Shift + M
  group_by(cor_cabelo) %>% # agrupando por sexo
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # calculado a freq relativa
         perc = fi*100) # porcentagem de frequência

# GA
dados_turmas %>% # Pipe Control + Shift + M
  group_by(GA) %>% # agrupando por sexo
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # calculado a freq relativa
         perc = fi*100) # porcentagem de frequência

### Gráfico de colunas
# GA
dados_turmas %>% # Pipe Control + Shift + M
  group_by(GA) %>% # agrupando por sexo
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # calculado a freq relativa
         perc = fi*100) %>% # porcentagem de frequência
  ggplot(aes(x=GA, y=perc)) + #área do gráfico
  geom_col(color="red",fill="orange")


# Cor de cabelo
dados_turmas %>% # Pipe Control + Shift + M
  group_by(cor_cabelo) %>% # agrupando por sexo
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # calculado a freq relativa
         perc = fi*100) %>% # porcentagem de frequência
  ggplot(aes(x=cor_cabelo, y=perc,
             fill=cor_cabelo)) + #área do gráfico
  geom_col(color="black")

# gráfico de barra
dados_turmas %>% # Pipe Control + Shift + M
  group_by(cor_cabelo) %>% # agrupando por sexo
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # calculado a freq relativa
         perc = fi*100) %>% # porcentagem de frequência
  ggplot(aes(y=cor_cabelo, x=perc,
             fill=cor_cabelo)) + #área do gráfico
  geom_col(color="black")


# Gráfico de Setores
# Sexo
dados_turmas %>% # Pipe Control + Shift + M
  group_by(sexo) %>% # agrupando por sexo
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # calculado a freq relativa
         perc = fi*100) %>%
  ggplot(aes(x="",y=perc, fill=sexo)) +
  geom_bar(stat="identity") +
  coord_polar("y", start=0) +
  theme_void()+
  geom_text(
    aes(
      label=paste0(round(perc), "%")),
    position=position_stack(vjust = 0.5))


# GA
dados_turmas %>% # Pipe Control + Shift + M
  group_by(GA) %>% # agrupando por sexo
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # calculado a freq relativa
         perc = fi*100) %>%
  ggplot(aes(x="",y=perc, fill=GA)) +
  geom_bar(stat="identity") +
  coord_polar("y", start=0) +
  theme_void()+
  geom_text(
    aes(
      label=paste0(round(perc), "%")),
    position=position_stack(vjust = 0.5))


# Simulando a tabela de idades no R
# calculando a média para idade pelos dados originais e pela frequência
# relativa
idades <- 18:20
ni <- c(5,7,4)
x <- rep(idades, ni)
mean(x)
# ou

fi <- ni/16
sum(idades * fi)

# Construindo a tabela de frequências para idade
# Idade
dados_turmas %>% # Pipe Control + Shift + M
  group_by(idade_anos) %>% # agrupando por sexo
  summarise(ni = n() ) %>% # freq absoluta
  mutate(fi = ni/n, # calculado a freq relativa
         perc = fi*100) # porcentagem de frequência

# Média das idades
dados_turmas %>%
  pull(idade_anos) %>% # tirei idades com pull
  mean()

# ou
mean(dados_turmas$idade_anos) # tirei com o $

# Menor valor de idade
dados_turmas %>%
  pull(idade_anos) %>%
  min()

# Maior valor de idade
dados_turmas %>%
  pull(idade_anos) %>%
  max()

# resumo das idade
dados_turmas %>%
  pull(idade_anos) %>%
  summary()

# Boxplot da Altura
dados_turmas %>%
  ggplot(aes(y=altura)) +
  geom_boxplot()

# Boxplot da idade
dados_turmas %>%
  ggplot(aes(y=idade_anos)) +
  geom_boxplot()


dados_turmas %>%
  ggplot(aes(x=idade_anos)) +
  geom_boxplot(fill="orange",
               outlier.size = 4,
               outlier.shape = 21,
               outlier.color = "red",
               outlier.fill = "blue"
  )+
  coord_cartesian(ylim=c(-1,1))+
  theme_classic()


## exemplo
dados_turmas %>%
  ggplot(aes(y=altura,
             fill=GA)) +
  geom_boxplot()

dados_turmas %>%
  ggplot(aes(y=altura,
             fill=as.factor(idade_anos))) +
  geom_boxplot()

dados_turmas %>%
  ggplot(aes(y=idade_anos,
             fill=GA)) +
  geom_boxplot()


# Vamos tirar o máximo e o mínimo
# resumo das idade
dados_turmas %>%
  pull(altura) %>%
  range() %>%
  diff()

### Inpterpolando
1.664 + 0.082 * 23.47/24.49


## vamos pegar a mediana real das alturas
dados_turmas %>%
  pull(altura) %>%
  median()


