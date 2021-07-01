# 1 - As demonstrações E e Var
# 2 - Acumulada
# 3 - Exemplo com as três possibilidade de prob
# menor entre e maiior
# 4 -  Adicionar a acumulada
# 5 - convergência para normal com o aumento da amostra
library(tidyverse)
library(shiny)
library(shinydashboard)
library(plotly)

ui <- dashboardPage(
  header=dashboardHeader(
    title = "Estatística-UNESP"
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Distribuições Discretas",icon = icon("chart-bar"),
               menuItem("Binomial",tabName = "binomial"),
               menuItem("Poisson", tabName = "poisson"),
               menuItem("Geométrica",tabName = "geometrica"),
               menuItem("Hipergeométrica",tabName = "hipergeometrica")
      ),
      menuItem("Distribuições Contínuas",icon = icon("chart-area"),
               menuItem("Normal",tabName = "normal"),
               menuItem("Amostral - Média",tabName = "amostral_media"),
               menuItem("Amostral - Proporção",tabName = "amostral_prop"),
               menuItem("Estimação",tabName = "estimativa")
               #menuItem("Exponencial",tabName = "exponencial"),
               #menuItem("Qui-quadrado",tabName = "quiquadrado"),
               #menuItem("F de Snedecor",tabName = "fsnedecor"),
               #menuItem("t de Student",tabName = "tstudent")
      )
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
        fluidRow(
          column(
            width = 6,
            h1("Ditribuição Binomial")
          )
        ),
        hr(style = "border-top: 1px solid black;"),
        fluidRow(
          column(
            width = 8,
            withMathJax(includeMarkdown("binomial.md"))
          )
        ),
        hr(style = "border-top: 1px solid black;"),
        fluidRow( # sempre usar com Colum, para não dar toque
          column(
            width = 3,
            numericInput("nb","Número de tentativas (n)",min=1,
                         max=1000,
                         value = 5,
                         step = 1)
          ),
          column(
            width = 3,
            sliderInput("pb","Probabilidade de sucesso (p)",
                        min=0,
                        max=1,
                        value = .50,
                        step = .01)
          ),
          column(
            width = 3,
            numericInput("valor_inicial","Sucessos minímo",min=0,
                         max=1000,value = 0,step = 1)
          ),
          column(
            width = 3,
            numericInput("valor_final","Sucessos máximo",min=0,
                         max=1000,value = 0,step = 1)
          ),
          column(
            width = 12,
            plotlyOutput("grafico_histBinom")
          ),
          column(
            width = 12,
            dataTableOutput("tabBinom")
          )
        )
      ),
      tabItem(
        tabName = "poisson",
        fluidRow(
          column(
            width = 12,
            h1("Ditribuição de Poisson")
          )
        ),
        hr(style = "border-top: 1px solid black;"),
        fluidRow(
          column(
            width = 12,
            withMathJax(includeMarkdown("poisson.md"))
          )
        ),
        hr(style = "border-top: 1px solid black;"),
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
            dataTableOutput("tabPois")
          )
        )
      ),
      tabItem(
        tabName = "geometrica",
        fluidRow(
          column(
            width = 12,
            h1("Ditribuição Geométrica")
          )
        ),
        hr(style = "border-top: 1px solid black;"),
        fluidRow(
          column(
            width = 12,
            withMathJax(includeMarkdown("geometrica.md"))
          )
        ),
        hr(style = "border-top: 1px solid black;"),
        fluidRow(
          column(
            width = 3,
            numericInput("n_g","Número de tentativas (n)",min=1,
                         max=1000,
                         value = 10,
                         step = 1)
          ),
          column(
            width = 3,
            sliderInput("p_g","Probabilidade de sucesso (p)",
                        min=0,
                        max=1,
                        value = .50,
                        step = .01)
          ),
          column(
            width = 3,
            numericInput("valor_inicial_g","Sucessos minímo",min=0,
                         max=1000,value = 0,step = 1)
          ),
          column(
            width = 3,
            numericInput("valor_final_g","Sucessos máximo",min=0,
                         max=1000,value = 0,step = 1)
          ),
          column(
            width = 12,
            plotOutput("grafico_histgeometrica")
          ),
          column(
            width = 6,
            dataTableOutput("tabgeom")
          )
        )
      ),
      tabItem(
        tabName = "hipergeometrica",
        fluidRow(
          column(
            width = 12,
            h1("Ditribuição Hipergométrica")
          )
        ),
        hr(style = "border-top: 1px solid black;"),
        fluidRow(
          column(
            width = 12,
            withMathJax(includeMarkdown("hipergeometrica.md"))
          )
        ),
        hr(style = "border-top: 1px solid black;"),
        fluidRow(
          column(
            width = 4,
            numericInput("N_hg","Tamanho da população (N)",min=2,
                         max=1000,
                         value = 10,
                         step = 1)
          ),
          column(
            width = 4,
            numericInput("M_hg","Número de sucessos (M)",min=1,
                         max=1000,
                         value = 5,
                         step = 1)
          ),
          column(
            width = 4,
            numericInput("r_hg","Amostras retiradas (r)",min=1,
                         max=1000,
                         value = 5,
                         step = 1)
          ),
          column(
            width = 4,
            numericInput("valor_inicial_hg","Sucessos minímo",min=0,
                         max=1000,value = 0,step = 1)
          ),
          column(
            width = 4,
            numericInput("valor_final_hg","Sucessos máximo",min=0,
                         max=1000,value = 0,step = 1)
          ),
          column(
            width = 6,
            actionButton("atualizar","Gerar Gráfico e Tabela"),
            br(),
            br()
          ),
          column(
            width = 12,
            plotOutput("grafico_histhipergeometrica")
          ),
          column(
            width = 6,
            dataTableOutput("tabhipergeom")
          )
        )
      ),
      tabItem(
        "amostral_media",
        fluidRow(
          column(
            width = 12,
            h1("Ditribuição Amostral da Média")
          )
        ),
        hr(style = "border-top: 1px solid black;"),
        fluidRow(
          column(
            width = 6,
            uiOutput("ui_simulacao"),
            plotOutput("ui_populacao")
          ),
          column(
            width = 6,
            fluidRow(
              column(
                width = 12,
                sliderInput(
                  "n_1",
                  "Tamanho da amostra (n)",
                  min = 2,
                  max = 50,
                  value = 2
                )
              ),
              column(
                width = 12,
                plotOutput("ui_amostra_1")
              )
            )
          )
        )
      ),
      tabItem(
        "amostral_prop",
        fluidRow(
          column(
            width = 12,
            h1("Ditribuição Amostral da Proporção")
          )
        ),
        hr(style = "border-top: 1px solid black;"),
        h3("Dada a realização de n=10 ensaios de Bernoulli"),
        fluidRow(
          column(
            width = 12,
            style = "font-size:22px;",
            radioButtons(
              inputId = "total",
              label = "",
              choices = c("Total (T)","Proporção (p)"),
              selected = "Total (T)",
              inline =TRUE
            )
          ),
          box(
            width=6,
            fluidRow(
              column(
                width = 12,
                sliderInput(
                  inputId = "n_sim_p",
                  label = "Probabilida de sucesso (p)",
                  min = 0,
                  max = 1,
                  step=0.01,
                  value = 0.5
                )
              )
            )
          ),
          box(
            width = 6,
            sliderInput(
              "n_p",
              "Tamanho da amostra (n)",
              min = 2,
              max = 100,
              value = 2
            )
          ),
          column(
            width = 6,
            plotOutput("ui_populacao_p"),
          ),
          fluidRow(
            column(
              width = 6,
              plotOutput("ui_amostra_p")
            )
          )
        )
      ),
      tabItem(
        tabName = "estimativa",
        fluidRow(
          column(
            width = 12,
            h1("Estimação")
          )
        ),
        hr(style = "border-top: 1px solid black;"),
        fluidRow(
          column(
            width = 12,
            fluidRow(
              box(
                width = 6,
                title = "Selecione o tamanho da população",
                solidHeader = TRUE ,
                status = "primary",
                sliderInput(
                  "N_pop",
                  "",
                  min = 1000,
                  max = 50000,
                  value = 10000
                )
              ),
              # infoBoxOutput("media_pop"),
              # infoBoxOutput("var_pop"),
              # infoBoxOutput("sd_pop"),
              box(
                  width = 6,
                  title = "Selecione o tamanho da amostra",
                  solidHeader = TRUE ,
                  status = "primary",
                  sliderInput(
                    "n_amostra",
                    "",
                    min = 2,
                    max = 60,
                    value = 2
                  )

              )
            )
          )
        ),
        fluidRow(
          column(
            width = 12,
            fluidRow(
               box(
                width = 3,
                title = "Média vs Variância",
                solidHeader = TRUE ,
                status = "primary",
                plotOutput("media_var")
              ),
              box(
                width = 3,
                title = "Esperança do Estimador Viciado (Variância)",
                solidHeader = TRUE ,
                status = "primary",
                plotOutput("esperanca_viciado")
              ),
              box(
                width = 3,
                title = "Esperança do Estimador Não Viciado (Variância)",
                solidHeader = TRUE ,
                status = "primary",
                plotOutput("esperanca_n_viciado")
              ),
              box(
                width = 3,
                title = "Esperança do Desvio Padrão",
                solidHeader = TRUE ,
                status = "primary",
                plotOutput("esperanca_desvio_padrao")
              )
            )
          )
        )
      )
    )
  ),
  title = "Estatística e Informática - UNESP FCAV",
)

server <- function(input, output, session) {
  Sys.sleep(3)

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

  output$grafico_histBinom <- renderPlotly({
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
      labs(title = paste0("P(X) = ",round(Prob,4),"\nE(X) = ",round(EX,4),"\nVar(X) = ",round(VarX,4)))
  })
  output$tabBinom <- renderDataTable({
    p <- input$pb
    n <- input$nb
    tibble(X = 0:n, `P(X = x)` = round(dbinom(X,n,p),4),
           `P(x) acumulada` = round(cumsum(`P(X = x)`),4))
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
      labs(title = paste0("P(X) = ",round(Prob,4),"\nE(X) = ",round(EX,4),"\nVar(X) = ",round(VarX,4)))
  })
  output$tabPois <- renderDataTable({
    lmbd <- input$lambda
    n <- input$np
    tibble(X = 0:ceiling(n), `P(X = x)` = round(dpois(X,lmbd),4),`P(x) acumulada` = round(cumsum(`P(X = x)`),4))
  })

  output$tabgeom <- renderDataTable({
    p <- input$p_g
    n <- input$n_g
    tibble(Y = 0:n,
           `P(Y = n)` = round(dgeom(Y,p),4),
           `P(y) acumulada` = round(cumsum(`P(Y = n)`),4)
    )
  })

  output$grafico_histgeometrica <- renderPlot({
    p <- input$p_g
    n <- input$n_g
    EY <- (1-p)/p
    VarY <- (1-p)/p/p
    vi<-input$valor_inicial_g
    vf<-input$valor_final_g
    if(vi>vf) vf<-vi
    if(vi == vf){
      Prob = dgeom(vi,p)
    }else if(vi < vf) {
      Prob = sum(dgeom(vi:vf,p))
    }else{
      Prob = 0
    }
    tibble(y = 0:n,
           py = dgeom(y,p),
           py2=py) |>
      mutate(py2 = if_else(y>=vi & y<= vf,py2,0)) |>
      ggplot() +
      geom_col(aes(x=y,y=py),color="black",fill="lightblue") +
      geom_col(aes(x=y,y=py2),color="black",fill="yellow",alpha=.5) +
      theme_bw()+
      labs(title = paste0("P(Y=n) = ",round(Prob,4),"\nE(Y) = ",round(EY,4),"\nVar(Y) = ",round(VarY,4)),
           x="Número de Falhas até o Sucessos (n)",
           y="P(Y=n)")
  })

  output$tabhipergeom <- renderDataTable({
    tabela_hiper()
  })

  tabela_hiper <- eventReactive(input$atualizar,{
    N <- input$N_hg
    M <- input$M_hg
    r <- input$r_hg
    tibble(X = 0:r,
           `P(X = x)` = round(dhyper(X,M,(N-M),r),4),
           `P(X) acumulada` = round(cumsum(`P(X = x)`),4)
    )
  })

  output$grafico_histhipergeometrica <- renderPlot({
    grafico_hyper()
  })

  grafico_hyper <- eventReactive(input$atualizar,{
    N <- input$N_hg
    M <- input$M_hg
    r <- input$r_hg
    if(M > N) N <- M
    EX <- r*M/N
    VarX <- r*M/N*(N-M)/N*(N-r)/(N-1)
    vi<-input$valor_inicial_hg
    vf<-input$valor_final_hg
    if(vi>vf) vf<-vi
    if(vi == vf){
      Prob = dhyper(vi,M,(N-M),r)
    }else if(vi < vf) {
      Prob = sum(dhyper(vi:vf,M,(N-M),r))
    }else{
      Prob = 0
    }
    tibble(x = 0:r,
           px = dhyper(x,M,(N-M),r),
           px2=px) |>
      mutate(px2 = if_else(x>=vi & x<= vf,px2,0)) |>
      ggplot() +
      geom_col(aes(x=x,y=px),color="black",fill="lightblue") +
      geom_col(aes(x=x,y=px2),color="black",fill="yellow",alpha=.5) +
      theme_bw()+
      labs(title = paste0("P(X=x) = ",round(Prob,4),"\nE(X) = ",round(EX,4),"\nVar(X) = ",round(VarX,4)))
  })
  ### Amostral da Média

  amostra <- reactive({
    req(input$n_sim)
    n <- input$n_sim
    x <- rep(rep(0:9,runif(10,3,30)%/%1),n)
  })

  output$ui_simulacao <- renderUI({
    sliderInput(
      inputId = "n_sim",
      label = "Tamanho da população (N)",
      min = 100,
      max = 1e4,
      step=1,sep="",
      value = 1000
    )
  })

  output$ui_populacao <- renderPlot({

    EX <- round(mean(amostra()),4)
    VarX <- round(var(amostra()),4)
    DPX <- round(sd(amostra()),4)

    tibble(x = amostra() ) |>
      ggplot(aes(x=x)) +
      geom_histogram(bins=10,color='black',fill="gray")+
      labs(x="Variável aleatória",
           y="Contagem",
           title = paste0("E(X) =",EX,";   Var(X) =",VarX,
                          ";   DP(X) =",DPX))+
      geom_vline(xintercept = EX, color="blue")+
      theme_bw()
  })

  output$ui_amostra_1 <- renderPlot({
    n <- input$n_1
    xb <- 0
    for(i in 1:10000) {
      xb[i] <- mean(sample(amostra(),size = n,replace = TRUE))
    }

    EX <- round(mean(xb),4)
    VarX <- round(var(xb),4)
    DPX <- round(sd(xb),4)

    tibble(x = xb ) |>
      ggplot(aes(x=x)) +
      geom_histogram(bins=10,color='black',fill="lightblue")+
      labs(x="Média da Variável aleatória",
           y="Contagem",
           title = paste0("E(Média) =",EX,";   Var(Média) =",VarX,
                          ";  DP(Média) =",DPX))+
      geom_vline(xintercept = EX, color="blue")+
      coord_cartesian(xlim=c(0,10))+
      theme_bw()
  })

  ### Amostral da PROPORÇÃO

  amostra_p <- reactive({
    p <- input$n_sim_p
    n_ <- 10
    rbinom(1000,n_,p)
  })

  output$ui_populacao_p <- renderPlot({
    # browser()
    req(input$n_sim_p)

    if(input$total == "Total (T)"){
      EX <- round(mean(amostra_p()),4)
      VarX <- round(var(amostra_p()),4)
      DPX <- round(sd(amostra_p()),4)

      tibble(x = amostra_p() ) |>
        ggplot(aes(x=x)) +
        geom_histogram(bins=10,color='black',fill="gray")+
        labs(x="Variável aleatória",
             y="TOTAL (contagem)",
             title = paste0("E(X) =",EX,";   Var(X) =",VarX,
                            ";   DP(X) =",DPX))+
        geom_vline(xintercept = EX, color="blue")+
        coord_cartesian(xlim=c(0,10))+
        theme_bw()
    }else{
      EX <- round(mean(amostra_p()/10),4)
      VarX <- round(var(amostra_p()/10),4)
      DPX <- round(sd(amostra_p()/10),4)

      tibble(x = amostra_p()/10) |>
        ggplot(aes(x=x)) +
        geom_histogram(bins=10,color='black',fill="gray")+
        labs(x="Variável aleatória",
             y="Proporção (p)",
             title = paste0("E(X) =",EX,";   Var(X) =",VarX,
                            ";   DP(X) =",DPX))+
        geom_vline(xintercept = EX, color="blue")+
        coord_cartesian(xlim=c(0,1))+
        theme_bw()
    }

  }, height = 340)

  output$ui_amostra_p <- renderPlot({

    pop<-amostra_p()
    n_ <- input$n_p
    xb<-0
    for(i in 1:100) {
      x <- sample(pop, size = n_, replace = TRUE) #/n_
      xb[i]<- mean(x)
    }

    # xb <- sample(pop, size = n_, replace = TRUE)
    # browser()
    if(input$total == "Total (T)"){
      EXp <- round(mean(xb),4)
      VarXp <- round(var(xb),4)
      DPXp <- round(sd(xb),4)

      tibble(x = xb ) |>
        ggplot(aes(x=x)) +
        geom_histogram(bins=10,color='black',fill="lightblue") +
        labs(x="Média da Variável aleatória",
             y="Total (Contagem)",
             title = paste0("E(Média) =",EXp,";   Var(Média) =",VarXp,
                            ";   DP(Média) =",DPXp)) +
        geom_vline(xintercept = EXp, color="blue") +
        coord_cartesian(xlim=c(0,10))+
        theme_bw()
    }else{
      xb <- xb/10
      EXp <- round(mean(xb),4)
      VarXp <- round(var(xb),4)
      DPXp <- round(sd(xb),4)

      tibble(x = xb ) |>
        ggplot(aes(x=x)) +
        geom_histogram(bins=10,color='black',fill="lightblue") +
        labs(x="Média da Variável aleatória",
             y="Proporção (p)",
             title = paste0("E(Média) =",EXp,";   Var(Média) =",VarXp,
                            ";   DP(Média) =",DPXp)) +
        geom_vline(xintercept = EXp, color="blue") +
        coord_cartesian(xlim=c(0,1))+
        theme_bw()
    }
  }, height = 340)


  pop <- reactive({
    rnorm(input$N_pop)

  })

  output$media_pop <- renderInfoBox({
    media_pop <- mean(pop())

    infoBox(
      title = "Média real",
      value = round(media_pop,4),
      icon = icon("hand-point-right"),
      fill = TRUE,
      color="blue", # validColors {shinydashboard} algumas válidas na documentação
      width = 4 # já é padrão, não precisa de column
    )
  })

  output$var_pop <- renderInfoBox({
    var_pop <- var(pop())

    infoBox(
      title = "Variância",
      value = round(var_pop,4),
      icon = icon("chart-line"),
      fill = TRUE,
      color="blue", # validColors {shinydashboard} algumas válidas na documentação
      width = 4 # já é padrão, não precisa de column
    )
  })

  output$sd_pop <- renderInfoBox({
    sd_pop <- sd(pop())

    infoBox(
      title = "Desvio Padrão",
      value = round(sd_pop,4),
      icon = icon("project-diagram"),
      fill = TRUE,
      color="blue", # validColors {shinydashboard} algumas válidas na documentação
      width = 4 # já é padrão, não precisa de column
    )
  })

  amostragem <- reactive({
    req(input$n_amostra)
    n = input$n_amostra
    medias = 0
    var_est_pop = 0
    var_est_amos = 0
    dp_est_amos = 0
    for(i in 1:1000){
      am<-sample(pop(),n,replace = TRUE)
      medias[i] = mean(am)
      var_est_pop[i] = sum((am-mean(am))^2)/length(am)
      var_est_amos[i] = sum((am-mean(am))^2)/(length(am)-1)
      dp_est_amos[i] = sd(am)
    }
    tibble(medias = medias,
         var_est_pop = var_est_pop,
         var_est_amos = var_est_amos,
         dp_est_amos = dp_est_amos
    )

  })

  output$media_var <- renderPlot({
    amostragem() |>
      ggplot(aes(x=medias, y= var_est_pop)) +
      geom_vline(xintercept = mean(pop()),col=2, lwd=1.2)+
      geom_hline(yintercept = var(pop()),col=2, lwd=1.2)+
      theme_minimal()+
      coord_cartesian(xlim=c(-2,2),ylim = c(0,4))+
      geom_point(col="blue")

  })

  output$esperanca_viciado <- renderPlot({
    amostragem() |>
      ggplot(aes(x=mean(medias), y= mean(var_est_pop))) +
      geom_vline(xintercept = mean(pop()),col=2, lwd=1.2)+
      geom_hline(yintercept = var(pop()),col=2, lwd=1.2)+
      theme_minimal()+
      coord_cartesian(xlim=c(-1,1),ylim = c(0,1.5))+
      geom_point(col="blue",size=4)

  })

  output$esperanca_n_viciado <- renderPlot({
    amostragem() |>
      ggplot(aes(x=mean(medias), y= mean(var_est_amos))) +
      geom_vline(xintercept = mean(pop()),col=2, lwd=1.2)+
      geom_hline(yintercept = var(pop()),col=2, lwd=1.2)+
      theme_minimal()+
      coord_cartesian(xlim=c(-1,1),ylim = c(0,1.5))+
      geom_point(col="blue",size=4)

  })

  output$esperanca_desvio_padrao <- renderPlot({
    amostragem() |>
      ggplot(aes(x=mean(medias), y= mean(dp_est_amos))) +
      geom_vline(xintercept = mean(pop()),col=2, lwd=1.2)+
      geom_hline(yintercept = sd(pop()),col=2, lwd=1.2)+
      theme_minimal()+
      coord_cartesian(xlim=c(-1,1),ylim = c(0.75,1.5))+
      geom_point(col="blue",size=4)

  })

}

shinyApp(ui, server)
