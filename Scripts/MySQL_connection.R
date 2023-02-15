#Conexão com banco de dados e abertura de arquivos 
library(DBI)
library(tidyverse)

#Abre base de dados da FMT 
user <- rstudioapi::askForPassword("Database username") 
pass <- rstudioapi::askForPassword("Database password")

## Connection to MySQL server
mysqlconnection <- dbConnect(RMySQL::MySQL(),
                             server = 'marcosaboia.com',
                             port = 3306,
                             username = user,
                             password = pass,
                             database = 'marcosa1_itps',
                             client_encoding = 'utf8'
) 

#Seta UTF-8 para variáveis de texto 
dbSendQuery(mysqlconnection, "SET NAMES UTF8;") 

#Lista todas as tabelas do banco - remover depois de finalizado 
dbListTables(mysqlconnection)

#Faz a consulta e retorna todos os registros da tabela 
FMTQuery = dbSendQuery(mysqlconnection, "select * from diagnostico") 

#Cria um dataframe com os resultados da consulta 
FMT = fetch(FMTQuery, n = -1)