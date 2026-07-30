library(readxl)
library(dplyr)
library(openxlsx)
library(tidyverse)
#teste

# Pasta onde estão os arquivos
pasta <- "c:/Users/p4Nn/Downloads/power-query/"

# Lista dos arquivos Excel
arquivos <- list.files(
  pasta,
  pattern = "\\.xlsx$",
  full.names = TRUE
)

# Nomes das abas do primeiro arquivo
abas <- excel_sheets(arquivos[1])

# Lista para armazenar os dados consolidados
resultado <- list()

for(aba in abas){

  dados_aba <- lapply(arquivos, function(arq){

    read_excel(arq, sheet = aba) |>
      mutate(arquivo_origem = basename(arq))

  })

  resultado[[aba]] <- bind_rows(dados_aba)

}

# Criar arquivo consolidado
wb <- createWorkbook()

for(aba in names(resultado)){

  addWorksheet(wb, aba)

  writeData(
    wb,
    sheet = aba,
    resultado[[aba]]
  )

}

saveWorkbook(
  wb,
  "sucupira_consolidado.xlsx",
  overwrite = TRUE
)
