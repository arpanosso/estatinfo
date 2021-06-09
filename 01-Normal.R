library(tidyverse)
library(shiny)
library(shinydashboard)


ui <- dashboardPage(
  header=dashboardHeader(
    title = "Estatística-UNESP"
  ),
  dashboardSidebar(
    sidebarMenu(

      menuItem("Binomial",tabName = "binomial"),
      menuItem("Poisson", tabName = "poisson"),
      menuItem("Normal",tabName = "normal")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "normal",
        fluidRow( # sempre usar com Column, para não dar toque
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
            width = 4,
            numericInput("nb","Número de tentativas (n)",min=1,
                         max=1000,
                         value = 5,
                         step = 1)
          ),
          column(
            width = 4,
            sliderInput("pb","Probabilidade de sucesso (p)",
                        min=0,
                        max=1,
                        value = .50,
                        step = .01)
          ),
          column(
              width = 2,
              numericInput("valor_inicial","Sucessos minímo",min=0,
                           max=1000,value = 0,step = 1)
              ),
          column(
            width = 2,
              numericInput("valor_final","Sucessos máximo",min=0,
                           max=1000,value = 0,step = 1)
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
            width = 6,
            numericInput("lambda","Taxa de sucesso (lambda)",min=0.01,
                         max=1000,
                         value = 5,
                         step = 1)
          ),
          column(
            width = 6,
            numericInput("np","Número máximo de sucessos",
                        min=0,
                        max=100,
                        value = 12,
                        step = 1),
          ),
          column(
            width = 6,
            numericInput("valor_inicial_p","Sucessos minímo",min=0,
                         max=1000,value = 0,step = 1)
          ),
          column(
            width = 6,
            numericInput("valor_final_p","Sucessos máximo",min=0,
                         max=1000,value = 0,step = 1)
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
  title = "Estatística e Informática"
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
    vi<-input$valor_inicial
    vf<-input$valor_final
    EX <- n*p
    VarX <- n*p*(1-p)
    if(vi>vf) vf<-vi
    if(vi == vf){
      Prob = dbinom(vi,n,p)
      }else if(vi < vf) {
        Prob = sum(dbinom(vi:vf,n,p))
      }else{
        Prob = 0
        }
    tibble(x = 0:n, px = dbinom(x,n,p),px2=px) |>
      mutate(px2 = if_else(x>=vi & x<= vf,px2,0)) |>
      ggplot() +
      geom_col(aes(x=x,y=px),color="black",fill="lightblue") +
      geom_col(aes(x=x,y=px2),color="black",fill="yellow",alpha=.5) +
      theme_bw()+
      labs(title = paste0("P(X) = ",round(Prob,4),"\nE(X) = ",EX,"\nVar(X) = ",VarX))
  })
  output$tabBinom <- renderTable({
    p <- input$pb
    n <- input$nb
    tibble(X = 0:n, `P(X = x)` = dbinom(X,n,p),`P(x) acumulada` = cumsum(`P(X = x)`))
  })
  output$grafico_histPois <- renderPlot({
    lmbd <- input$lambda
    EX <- lmbd
    VarX <- lmbd
    n <- input$np
    vi<-input$valor_inicial_p
    vf<-input$valor_final_p
    if(vi>vf) vf<-vi
    if(vi == vf){
      Prob = dpois(vi,lmbd)
    }else if(vi < vf) {
      Prob = sum(dpois(vi:vf,lmbd))
    }else{
      Prob = 0
    }
    tibble(x = 0:ceiling(n), px = dpois(x,lmbd), px2=px) |>
      mutate(px2 = if_else(x>=vi & x<= vf,px2,0)) |>
      ggplot() +
      geom_col(aes(x=x,y=px),color="black",fill="lightblue") +
      geom_col(aes(x=x,y=px2),color="black",fill="yellow",alpha=.5) +
      theme_bw()+
      labs(title = paste0("P(X) = ",round(Prob,4),"\nE(X) = ",EX,"\nVar(X) = ",VarX))
  })
  output$tabPois <- renderTable({
    lmbd <- input$lambda
    n <- input$np
    tibble(X = 0:ceiling(n), `P(X = x)` = dpois(X,lmbd),`P(x) acumulada` = cumsum(`P(X = x)`))
  })

}



shinyApp(ui, server)
