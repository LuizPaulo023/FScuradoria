#' @title Descrições via ChatGPT
#' @details Função busca chamar a função GPT em loop e guardar as descrições em PT-EN
#' @author Luiz Paulo Tavares 

aux_chatGPT <- function(input_gpt){
  
  result_df <- data.frame(indicator_Code = character(),
                          PT_BR = character(),
                          EN_US = character(),
                          stringsAsFactors = FALSE)
  
    system.time({ # Cronometrar o tempo de processamento 
    # Pode ser comentado caso necessário \\\\\\\\\\\\\\\
    for (i in 1:nrow(input_gpt)) {
      
      # Chamando a função ChatGPT 
      description <- chatGPT(input_gpt$input[i])
      
      # Dividir o texto em PT-BR e EN-US usando "\n\n" como separador
      split_description <- base::unlist(strsplit(description, "\n\n", fixed = FALSE))
      
      # Extrair o código do indicador
      indicator_code <- input_gpt$indicator_code[i]

      pt_br <- split_description[1]
      en_us <- split_description[2]

      result_df <- rbind(result_df, data.frame(indicator_Code = indicator_code,
                                               PT_BR = pt_br,
                                               EN_US = en_us,
                                               stringsAsFactors = FALSE))
    }
  })
  
  result_df$PT_BR <- base::sub("PT-BR:", "", result_df$PT_BR)
  result_df$EN_US <- base::sub("EN-US:", "", result_df$EN_US)
  
  return(result_df)
  
}
