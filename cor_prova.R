library(tidyverse)
library(readxl)
dados <- read_excel("C:/Users/Not. Unesp/Dropbox/Prova-01-2023/dados-2023.xls") %>%
  janitor::clean_names()
A <- 5
B <- 10
C <- -8
D <-1.5

corrige_string <- function( x ){
  x <- stringr::str_replace_all(x,"mod","%%")
  x <- stringr::str_replace_all(x,"div","%/%")
  x <- stringr::str_replace_all(x,"rad","sqrt")
  eval(parse(text = x))
}

dados %>%
  mutate(cor2a = stringr::str_replace_all(
    stringr::str_replace_all(
    stringr::str_replace_all(x2a,"mod","%%"), "div","%/%"),"rad","sqrt"),

    cor2b = stringr::str_replace_all(
      stringr::str_replace_all(
        stringr::str_replace_all(x2b,"mod","%%"), "div","%/%"),"rad","sqrt"),

    cor2c = stringr::str_replace_all(
      stringr::str_replace_all(
        stringr::str_replace_all(x2c,"mod","%%"), "div","%/%"),"rad","sqrt")
    ) %>%
  mutate(
    evaluate = sapply(cor2a, function(x) eval(parse(text = x)))
    ) %>%
  select(evaluate)

