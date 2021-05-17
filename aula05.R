library(tidyverse)
library(readxl)
dados_turmas <- read_excel("C:/Users/Usuario/Downloads/dados_turmas.xlsx")
View(dados_turmas)

dados_turmas %>%
  ggplot(aes(x=idade_anos, y=..density..)) +
  geom_histogram(bins=10,
                 color="black",
                 fill="gray")+
  geom_vline(xintercept = 20.9184,
             color="blue")

dados_turmas %>%
  ggplot(aes(x=altura, y=..density..)) +
  geom_histogram(bins=6,
                 color="black",
                 fill="gray")+
  geom_vline(
    xintercept = 1.7242,
    color="blue")








X <- c(2,1,4,4,9)
median(X)
quantile(X,0.25)
quantile(X,0.50)
quantile(X,0.75)

x3<- c(0.6, 3.4, 9.8, 13.8, 17.4)
var(x3)
9+sd(x3)/sqrt(30)
sd(x3)/mean(x3)*100


library(tidyverse)
tab<-tibble(TV=c("58 a 179", "180 a 300", "301 a 422", "TOTAL"),
       GA=c(3,6,36,45),
       GI=c(6,19,24,49),
       TOTAL=c(9,25,60,94))

tab[2:4]/94

sum(tab$GA - mean(tab$GA))

tab %>%
  mutate(DGA = GA - mean(GA))















