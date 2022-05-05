# Lendo o Banco de dados
dados_turmas<-readr::read_rds("/data/dados_turmas.rds")

# Mostrando os 7 primeiro registros
head(dados_turmas, n=7)

# Caculando a Média de Idades
mean(dados_turmas$idade_anos)

# Construindo a distribuição de frequência da idade
hist(dados_turmas$idade_anos)
