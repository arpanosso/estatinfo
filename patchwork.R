n=1000
di <- 1/n*5
x<-seq(-4,4,di)
densidade <- dnorm(x)
g4<-tibble(x,densidade) |>
  mutate(
    densidade2 = if_else(x>-2 & x< -1, densidade,0)
  ) |>
  ggplot(aes(x=x,y=densidade))+
  geom_col(color="white",fill="white")+
  geom_col(aes(x=x,y=densidade2),color="gray") +
  labs(x="(X)",
       y="di")+
  theme_bw()+
  stat_function(fun = \(x) dnorm(x), color="black", lwd =1.2 )
g4 +
  draw_label(label = "f(x)",x=1,y=.3) +
  draw_label(label = expression(paste("P(",a <= X, "" <= b,")")),
             x=-2,y=.15)



options(digits=15)
x<-63780000+557.92
x


# gganimate ---------------------------------------------------------------
library(gganimate)
library(tidyverse)
library(patchwork)
library(cowplot)

n=5
di1 <- 1/n*5
x1<-seq(-4,4,di1)
densidade1 <- dnorm(x1)

n=15
di2 <- 1/n*5
x2<-seq(-4,4,di2)
densidade2 <- dnorm(x2)

n=50
di3 <- 1/n*5
x3<-seq(-4,4,di3)
densidade3 <- dnorm(x3)

n=1000
di4 <- 1/n*5
x4<-seq(-4,4,di4)
densidade4 <- dnorm(x4)

tab1 <- tibble(x=x1,dd=densidade1,g=1)
tab2 <- tibble(x=x2,dd=densidade2,g=2)
tab3 <- tibble(x=x3,dd=densidade3,g=3)
tab4 <- tibble(x=x4,dd=densidade4,g=4)
tab<-rbind(tab1,tab2,tab3,tab4)

tab |>
    ggplot(aes(x=x,y=dd))+
    geom_col(color="blue",fill="white")+
    labs(x="(X)",
         y="di") +
  theme_minimal() +
  #facet_wrap(~g,nrow=3)+
  exit_disappear() +
  transition_states(g , wrap = FALSE) +
  enter_grow() +
  enter_fade()




