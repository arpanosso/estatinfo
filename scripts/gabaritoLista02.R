library(tidyverse)

dados <- c(23,32,16,19,17,19,32,34,26,28,
28,21,28,27,24,34,24,20,33,29,
33,38,32,40,24,27,33,26,45,30,
28,29,34,15,36,20,31,29,29,16,
34,39,30,20,41,18,24,15,20,32)

dados[order(dados)]


table(dados) |> max()

dados |>
  tibble::as_tibble() |>
  summarise(
    Média = mean(value),
    Mediana = median(value),
    Desvio = sd(value),
    CV = 100*Desvio/Média
  ) |> kableExtra::kable()


