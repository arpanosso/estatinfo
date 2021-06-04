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





