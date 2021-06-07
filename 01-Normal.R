library(tidyverse)
library(shiny)
library(shinydashboard)


ui <- dashboardPage(
  header=dashboardHeader(
    title = "Estatística-UNESP"
  ),
  sidebar=dashboardSidebar(
    sidebarMenu(
      menuItem("Normal",tabName = "normal"),
      menuItem("Binomial",tabName = "binomial"),
      menuItem("Poisson", tabName = "poisson")
    )
  ),
  body=dashboardBody(
    tabItems(
      tabItem(
        tabName = "normal",
        fluidRow( # sempre usar com Colum, para não dar toque
          column(h2("Estudo dos Parâmetros da Normal"),width = 12),
          column(
            h3("Distribuição 01"),
            width = 4,
            sliderInput("m1","Média",
                        min=0,
                        max=100,
                        value = 50,
                        step = 1),
            numericInput("sd1","Desvio-padrão",min=5,
                         max=25,
                         value = 7,
                         step = 1)
          ),
          column(
            h3("Distribuição 02"),
            width = 4,
            sliderInput("m2","Média",
                        min=0,
                        max=100,
                        value = 50,
                        step = 1),
            numericInput("sd2","Desvio-padrão",min=5,
                         max=25,
                         value = 7,
                         step = 1)
          ),
          column(
            h3("Distribuição 03"),
            width = 4,
            sliderInput("m3","Média",
                        min=0,
                        max=100,
                        value = 50,
                        step = 1),
            numericInput("sd3","Desvio-padrão",min=5,
                         max=25,
                         value = 7,
                         step = 1)
          ),
          column(
            width = 12,
            plotOutput("grafico_hist")
          )
        )
      ),
      tabItem(
        tabName = "binomial",
        h1("Estudo de parâmetros Binomial"),
        fluidRow( # sempre usar com Colum, para não dar toque
          column(
            width = 5,
            numericInput("nb","Número de tentativas (n)",min=1,
                         max=1000,
                         value = 5,
                         step = 1)
          ),
          column(
            width = 5,
            sliderInput("pb","Probabilidade de sucesso (p)",
                        min=0,
                        max=1,
                        value = .50,
                        step = .01),
          ),
          column(
            width = 12,
            plotOutput("grafico_histBinom")
          ),
          column(
            width = 12,
            tableOutput("tabBinom")
          )
        )
      ),
      tabItem(
        tabName = "poisson",
        h1("Estudo de parâmetros Poisson"),
        fluidRow( # sempre usar com Colum, para não dar toque
          column(
            width = 5,
            numericInput("lambda","Taxa de sucesso",min=0.01,
                         max=1000,
                         value = 5,
                         step = 1)
          ),
          column(
            width = 5,
            numericInput("np","Número de sucessos procurados",
                        min=0,
                        max=100,
                        value = 5,
                        step = 1),
          ),
          column(
            width = 12,
            plotOutput("grafico_histPois")
          ),
          column(
            width = 6,
            tableOutput("tabPois")
          )
        )
      )
    )
  ),
  title = "Meu App"
)



server <- function(input, output, session) {
  output$grafico_hist <- renderPlot({
    ggplot(data.frame(x = c(0, 100)), aes(x = x)) +
      stat_function(fun = \(x) dnorm(x,input$m1,input$sd1),
                    col="red")+
      stat_function(fun = \(x) dnorm(x,input$m2,input$sd2),
                    col="blue") +
      stat_function(fun = \(x) dnorm(x,input$m3,input$sd3),
                    col="darkgreen")+
      theme_bw() +
      labs(x="Variável aleatória (X)",
           y="Densidade de frequência")+
      theme(
        axis.title.x = element_text(size = 16),
        axis.title.y = element_text(size = 16)
      )+
      geom_vline(xintercept = c(input$m1,input$m2,input$m3),
                 color = "darkgray",lty=2)
  })

  output$grafico_histBinom <- renderPlot({
    p <- input$pb
    n <- input$nb
    tibble(x = 0:n, px = dbinom(x,n,p)) |>
      ggplot(aes(x=x,y=px)) +
      geom_col(color="black",fill="lightblue") +
      theme_bw()

  })
  output$tabBinom <- renderTable({
    p <- input$pb
    n <- input$nb
    tibble(x = 0:n, px = dbinom(x,n,p))
  })

  output$grafico_histPois <- renderPlot({
    lmbd <- input$lambda
    n <- input$np
    tibble(x = 0:ceiling(n*2), px = dpois(x,lmbd)) |>
      ggplot(aes(x=x,y=px)) +
      geom_col(color="black",fill="lightblue") +
      theme_bw()
})

  output$tabPois <- renderTable({
    lmbd <- input$lambda
    n <- input$np
    tibble(x = 0:ceiling(n*2), px = dpois(x,lmbd))
  })

}



shinyApp(ui, server)
