base::rm(list = ls())
graphics.off()

# Dependências =================================================================
# library(pacman)

pacman::p_load(tidyverse, httr, stringr, stringi)

# Configurações de ambiente do usuário

user = base::getwd() %>%
       stringr::str_extract("^((?:[^/]*/){3})") %>% print()

path <- '4intelligence/Feature Store - Documentos/DRE/curadoria/'
setwd(paste0(user,path))

source("urls.R")

token_to_use = c(
  'Authorization' = 'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjgyX3VOQkNKVENnU0VNX3Z2TjR2LSJ9.eyJodHRwczovLzRpbnRlbGxpZ2VuY2UuY29tLmJyL2VtYWlsIjoibC50YXZhcmVzQDRpbnRlbGxpZ2VuY2UuY29tLmJyIiwiaHR0cHM6Ly80aW50ZWxsaWdlbmNlLmNvbS5ici91c2VyX21ldGFkYXRhIjp7fSwiaHR0cHM6Ly80aW50ZWxsaWdlbmNlLmNvbS5ici9hcHBfbWV0YWRhdGEiOnsicm9sZXMiOlsiaXNFZGl0b3IiLCJpczRpIiwiaXNGYWFTIiwiaXNGZWF0dXJlU3RvcmUiLCJpc0ZzQWRtaW4iLCJpc0JldGEiXSwic2hpbnlwcm94eV9yb2xlcyI6WyJiZG1nIl19LCJodHRwczovLzRpbnRlbGxpZ2VuY2UuY29tLmJyL25hbWUiOiJsLnRhdmFyZXNANGludGVsbGlnZW5jZS5jb20uYnIiLCJpc3MiOiJodHRwczovLzRpbnRlbGxpZ2VuY2UuYXV0aDAuY29tLyIsInN1YiI6ImF1dGgwfDYyMzRjNDI0YTE4ZjM3MDA2OGI3MTFkOSIsImF1ZCI6WyI0Y2FzdGh1YiIsImh0dHBzOi8vNGludGVsbGlnZW5jZS5hdXRoMC5jb20vdXNlcmluZm8iXSwiaWF0IjoxNzAzMTgwNjIyLCJleHAiOjE3MDU3NzI2MjIsImF6cCI6Im1TS1pxSDVLcTFXb2N4SmNsbklVUmJWSUtVV1Jqb0p6Iiwic2NvcGUiOiJvcGVuaWQgcHJvZmlsZSBlbWFpbCIsInBlcm1pc3Npb25zIjpbImFzazpxdWVzdGlvbnMiLCJjcmVhdGU6cHJvamVjdHMiLCJlZGl0OmFjY2Vzcy1ncm91cHMiLCJlZGl0OmluZGljYXRvcnMiLCJlZGl0Om15LWdyb3VwcyIsImVkaXQ6b2JzZXJ2YXRpb25zIiwiZWRpdDpwcmVkZWZpbmVkLWdyb3VwcyIsImVkaXQ6cHJvamVjdGlvbnMiLCJlZGl0OnNlcmllcyIsInJlYWQ6YWNjZXNzLWdyb3VwcyIsInJlYWQ6ZG9tYWlucyIsInJlYWQ6aW5kaWNhdG9ycyIsInJlYWQ6bXktZ3JvdXBzIiwicmVhZDpvYnNlcnZhdGlvbnMiLCJyZWFkOnByZWRlZmluZWQtZ3JvdXBzIiwicmVhZDpwcm9qZWN0aW9ucyIsInJlYWQ6cHJvamVjdHMiLCJyZWFkOnNlcmllcyJdfQ.D4c24Fd1NrguKMQOQRDwNeyT0gH5PShEnv44EXR_8ZB9tOg7Ng05pJNfmHnFQooMTYHBn9dEfGTLO4a3CcXbc9fRF0DDdZ9mWzY1idHS0GOdUEcZrDRCZ3DTUb8Ly0SfnRpjsn8CWatZVY6L8N7vrbiaId3R4jHs2x3PhaoyW0_HCr6glSTctmDx1CSSRwgpIaAXROZAdUWBRCStssmixn1aovGRaalh9hjMic3LTlHsWlWgppoW9LoKyexM-M3E9sbzGoeVC4VnqtD1zFp6DDagXMnXVWXKbzkdbYX0q-IqGftezytIM4s9KPjptcFa1h_m9h-EeWE4AlLPdWnF-Q',
  'Content-Type' = 'application/json'
)

# Escolha o ambiente prod ou stg #\ opções: stg, prod

url_to_use = urls(environment = "prod")

# Ambiente de testes ===========================================================
# setwd("C:/Users/LuizPauloTavaresGonç/OneDrive - 4intelligence/Área de Trabalho")
# series_atrasadas = readxl::read_excel("series_atrasadas_internal_28_11.xlsx") %>%
#   dplyr::mutate(indicator = substr(serie, 1,9))

# indicator = "BRIND0001"

domains_fs = FScuradoria::get_domains(token = token_to_use, url = url_to_use)

tree_fs = FScuradoria::get_tree(master_node = "Brazil",
                                token = token_to_use,
                                url = url_to_use)

id_tree_fs = FScuradoria::get_id(tree = tree_fs, node = "Brazil")


metadados_series = FScuradoria::get_metadados_series(indicator = indicator,
                                                     token = token_to_use,
                                                     url = url_to_use)

clean_sids_metadados = FScuradoria::get_clean_sids(metadados_series = metadados_series)

# series_delete = FScuradoria::delete_select()
# delete = FScuradoria::delete_series()

  # test_get_sids = get_sids(url = url_to_use,
  #                          token = token_to_use,
  #                          indicators = "BRSTS0050")








