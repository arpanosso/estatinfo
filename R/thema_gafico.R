library(extrafont)
library(xkcd)
windowsFonts("Humor Sans" = windowsFont("Humor Sans"))
theme_grafico <- theme(
  panel.background = element_rect(fill="white",colour = "white"),
  axis.ticks = element_line(colour="black"),
  panel.grid = element_line(colour="white"),
  axis.text.y = element_text(colour="black"),
  axis.text.x = element_text(colour="black"),
  text = element_text(size=16, family="Humor Sans"),
 # plot.background = element_rect(color="black"),
  plot.title = element_text(hjust = 0.5,color="blue"),
#  legend.position = "bottom"
)





