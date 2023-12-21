#' @title PipeDescription
#' @details Script encarregado de gerar as descrições dos indicadores 
#' ATENÇÃO: Dependente apenas da planilha {novos_indicadores.xlsx}
#' @author Luiz Paulo Tavares 

# base::rm(list = ls())
# grDevices::graphics.off()

# Dependências =================================================================
# install.packages("pacman") # caso não tenha o pacman instaldo 
# library(pacman)

pacman::p_load(tidyverse, httr, jsonlite, stringr, readxl, writexl)

# Definindo ambiente de trabalho ===============================================

user = base::getwd() %>%
       stringr::str_extract("^((?:[^/]*/){3})") %>% print()

path = paste0(user, '4intelligence/Feature Store - Documentos/DRE/curadoria/')
base::setwd(path)

# Chamando as funções ==========================================================

functions <- c("chatGPT", "aux_chatGPT", "save_clean_data")

for (i in functions) {
  source(base::file.path(paste0(path, "functions_descricao/"), paste0(i, ".R")))
}

# Importando a base de novos_indicadores para preenchimento =====================

indicators <- readxl::read_excel("novos_indicadores.xlsx")

# Input que vai ser enviado para o GPT =========================================
# Tem uma forma pré-definida, porém: 
# Pode ser editado de acordo com a necessidade do usuário 
 
input <- indicators %>% 
         dplyr::mutate(input = paste0("Faça a descrição em PT-BR e em EN-US do seguinte indicador: ", name_pt_fs, "."," A descrição precisa ter, necessariamente, no máximo 5 linhas para cada indicador e ser padronizada. Assim: explique de forma detalhada o significado, as particularidades e, principalmente, a função do indicador."))

#  print(input$input)

# Chamando as funções considerando o input passado =============================

output <- aux_chatGPT(input_gpt = input)
# View(output) # Visualize as descrições 

# Salvando na planilha {novos_indicadores.xlsx} \\\ ============================
# getwd()

save_clean_data(data_base = indicators, description = output)

  