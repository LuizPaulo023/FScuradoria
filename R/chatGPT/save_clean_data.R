#' @title Salvando as descrições 
#' @details Guardar de forma organizada as descrições na planilha {novos_indicadores.xlsx}
#' @author Luiz Paulo Tavares 

save_clean_data <- function(data_base, description){
  
  data_clean <- description %>% 
                janitor::clean_names() %>% 
                base::merge(data_base, by = "indicator_code") %>% 
                dplyr::mutate(description_pt_fs = base::trimws(pt_br), 
                              description_en_fs = base::trimws(en_us)) %>% 
                dplyr::select(-pt_br, -en_us)
  
  # Salvando no diretório de trabalho 
  # getwd()
  
  writexl::write_xlsx(data_clean, "novos_indicadores.xlsx")
  cat("Descrições salvas em 'novos_indicadores.xlsx'")
}
