
# Modified from https://shiny.rstudio.com/tutorial/written-tutorial/lesson1/
library(tidyverse)
library(shiny)
library(shinythemes)
data(airquality)

# Define UI for app that draws a histogram ----
ui <- fluidPage(

                # App title ----
                titlePanel("Estudo de parâmetros Distribuição Normal"),

                # Sidebar layout with input and output definitions ----
                sidebarLayout(
                  # Sidebar panel for inputs ----
                  sidebarPanel(
                    width = 3,
                    # Input: Slider for the number of bins ----
                    sliderInput(inputId = "media",
                                label = "Valor da média",
                                min = 0,
                                max = 50,
                                value = 25,
                                ste= 2),
                    sliderInput(inputId = "variancia",
                                label = "Valor da variancia",
                                min = 0,
                                max = 25,
                                value = 5)

                  ),

                  # Main panel for displaying outputs ----
                  mainPanel(
                    width = 9,

                    # Output: plot ----
                    plotOutput(outputId = "distPlot")

                  )
                )
)

# Define server logic required to draw a plot ----
server <- function(input, output) {
  output$distPlot <- renderPlot({
    m<-input$media
    v<-input$variancia
    curve(dnorm(x,m,sqrt(v)),0,50,
          las=1,ylim=c(0,0.28),
          col="red",
          lwd=1.2,
          xlab="variável x",
          ylab="Densidade",
          main=paste("N(",m,v,")"))
    abline(v=input$media,lty=2,col="blue")



  })

}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
