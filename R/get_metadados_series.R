#' @title Importando os metadados de todas as series do indicador selecionado
#' @name get_metadados_series
#'
#' @description
#'
#'
#' @author Luiz Paulo Tavares Gonçalves
#'
#' @return
#'
#' @examples
#' \dontrun{
#'
#' metadados_series = get_metadados_series(indicator = indicator,
#'                                         token = token_to_use,
#'                                         url = url_to_use)
#'
#' }
#'
#' @export

get_metadados_series <- function(indicator = as.character(),
                       token = as.character(),
                       url = as.character()){

 httr::VERB("GET",
            url = paste0(url, "api/v1/indicators/", indicator, "/series?limit=3000"),
            add_headers(token)) %>%
 httr::content("parsed")

}


