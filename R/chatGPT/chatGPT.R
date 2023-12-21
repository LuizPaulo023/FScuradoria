#' @title ChatGPT 
#' @details Função que chama a API do ChatGPT 3.5 turbo 
#' @author Luiz Paulo Tavares 


chatGPT <- function(prompt, 
                    model = "gpt-3.5-turbo",
                    temperature = 0,
                    apiKey = "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"){
  
  response <- httr::POST(url = "https://api.openai.com/v1/chat/completions", 
                         add_headers(Authorization = paste("Bearer", apiKey)),
                         content_type_json(),
                         encode = "json",
                         body = list(model = model,
                                     temperature = temperature,
                                     messages = list(list(role = "user", content = prompt))))
  
  if(status_code(response) > 200) {
    stop(content(response))
  }
  
  base::trimws(content(response)$choices[[1]]$message$content)
}




