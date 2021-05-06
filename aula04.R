# Carregando o pacote
library(readxl)
# Lendo a base de dados no Excel
dados_turmas <- read_excel("C:/Users/Usuario/Downloads/dados_turmas.xlsx")
View(dados_turmas)

# Carregando o pacote
library(tidyverse) # não esqueça de instalar o tidyverse para ter o glimpse
# Resumo dos dados
glimpse(dados_turmas) # vislumbre, resumo rápido dos dados

##########################################
##            PARA SEXO                 ##
##########################################
tab<-dados_turmas %>% #PIPE
      group_by(sexo) %>%
      summarise(ni = n() )
tab

# organizando o bd por cat. de sexo
dados_turmas %>%
  arrange(sexo) %>%
  View()

# Frequencia Relativa
tab <-dados_turmas %>%
  group_by(sexo) %>%
  summarise(ni=n()) %>%
  mutate(fi = ni/sum(ni), # n = sum(ni)
         perc = fi*100)
tab

# Gráfico de Colunas
tab %>%
  ggplot( aes(x=sexo, y=fi) ) +
  geom_col()


# Gráfico de BARRAS
tab %>%
  ggplot( aes(y=sexo, x=fi) ) +
  geom_col(color="black",
           fill="gray")

# Mapeando Categorias por cor
tab %>%
  ggplot( aes(y=sexo, x=fi, fill=sexo) ) +
  geom_col()+
  scale_fill_manual(values = c("salmon","aquamarine4") ) +
  theme_bw()

# Gráfico de Setores ou Pizza ou Pie

tab %>%
  ggplot(aes(x="",y=fi, fill=sexo)) +
  geom_bar(stat="identity") +
  coord_polar("y", start=0) +
  theme_void()

## Adicionando os valores
tab %>%
  arrange(desc(perc)) %>%
  mutate(pos = cumsum(perc) - 0.5*perc) %>% #<<
  ggplot(aes(x="",y=perc, fill=sexo)) +
  geom_bar(stat="identity") +
  coord_polar("y", start=0) +
  theme_void() +
  geom_text(aes(y = pos, #<<
                label = round(perc,2)), #<<
            size=6)

##########################################
##            PARA COR DO CABELO        ##
##########################################
tab<-dados_turmas %>% #PIPE
  group_by(cor_cabelo) %>%
  summarise(ni = n() )
tab

# Frequencia Relativa
tab <-dados_turmas %>%
  group_by(cor_cabelo) %>%
  summarise(ni=n()) %>%
  mutate(fi = ni/sum(ni), # n = sum(ni)
         perc = fi*100)
tab

# Gráfico de Colunas
tab %>%
  ggplot( aes(x=cor_cabelo, y=fi) ) +
  geom_col()


# Gráfico de BARRAS
tab %>%
  ggplot( aes(y=cor_cabelo, x=fi) ) +
  geom_col(color="black",
           fill="gray")

# Mapeando Categorias por cor
tab %>%
  ggplot(aes(x=fi, y=cor_cabelo,
             fill=cor_cabelo)) +
  geom_col(color="black")+
  scale_fill_manual(values = c("salmon4",
                               "burlywood4",
                               "orange4",
                               "gold2",
                               "black"))+
  theme_minimal()

# Gráfico de Setores ou Pizza ou Pie

tab %>%
  ggplot(aes(x="", y=fi,
             fill=cor_cabelo)) +
  geom_bar(stat="identity",color="black") +
  coord_polar("y", start=0) +
  theme_void()

tab %>%
  ggplot(aes(width = 1,x="",y=perc, fill=cor_cabelo)) +
  geom_bar(stat="identity") +
  coord_polar("y", start=0) +
  theme_void() +
  geom_text(aes(label = paste0(round(perc), "%")),
            position = position_stack(vjust = 0.5))

##########################################
##            IDADE                     ##
##########################################
tab <-dados_turmas %>%
  group_by(idade_anos) %>%
  summarise(ni=n()) %>%
  mutate(fi = ni/sum(ni),
         perc = fi*100)
View(tab)
tab

# Gráfico de Colunas
tab %>%
  ggplot( aes(x=idade_anos, y=fi) ) +
  geom_col()

# Boxplot de IDADE (QUANTITATIVA)
x11()
dados_turmas %>%
  ggplot(aes(y=idade_anos)) +
  geom_boxplot()


# Boxplot de ALTURA (QUANTITATIVA)
dados_turmas %>%
  ggplot(aes(y=altura)) +
  geom_boxplot(fill="orange")


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

## Altura por Sexo
dados_turmas %>%
  ggplot(aes(y=altura,
             fill=GA)) +
  geom_boxplot()







##########################################
##            ALTURA                    ##
##########################################
tab <-dados_turmas %>%
  mutate(
    classes_altura = cut(altura,5)#
  ) %>%
  group_by(classes_altura) %>%
  summarise(ni=n()) %>%
  mutate(fi = ni/sum(ni),
         perc = fi*100)
tab

# CONCEITO DE ACESSO A COLUNAS
altura <- dados_turmas$altura

D<-max(altura)-min(altura)
k<-5
Di<-D/k
limites <- min(altura)+ 0:k * Di
limites

## HISTOGRAMA
dados_turmas %>%
  ggplot(aes(x=altura,y=..count..))+ # freq absoluta
  geom_histogram(breaks = limites,
                 color="black",
                 fill="gray") +
  labs(y="ni",x="ALTURA (M)")



tab <-dados_turmas %>%
  mutate(
    classes_altura = cut(altura,5)
  ) %>%
  group_by(classes_altura) %>%
  summarise(ni=n()) %>%
  mutate(fi = ni/sum(ni),
         perc = fi*100,
         di=fi/Di)
tab


dados_turmas %>%
  ggplot(aes(x=altura,y=..density..))+ # densidade
  geom_histogram(breaks = limites,
                 color="black",
                 fill="gray") +
  labs(y="di",x="ALTURA (M)")



# Acumuladas
tab <-dados_turmas %>%
  mutate(
    classes_altura = cut(altura,5)
  ) %>%
  group_by(classes_altura) %>%
  summarise(ni=n()) %>%
  mutate(fi = ni/sum(ni),
         perc = fi*100,
         di=fi/Di,
         Ni = cumsum(ni),
         Fi = cumsum(fi),
         Perc = cumsum(perc))
(tab)


# Densidade Suavizada
dados_turmas %>%
  ggplot(aes(x=altura,y=..density..))+
  geom_histogram(breaks = limites,
                 color="black",
                 fill="white") +
  geom_density(color="red",
               fill="green",
               alpha=0.05)

















