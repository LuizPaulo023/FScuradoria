#' @title Importando os Sids de todas as series do indicador selecionado
#' @name get_clean_sids
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
#' }
#'
#' @export

get_clean_sids <- function(metadados_series = as.list()){

  current_series <- tibble::tibble()

  for (i in 1:length(metadados_series[['data']])) {

    sid = metadados_series[['data']][[i]][['code']]

    current_series <- current_series %>%
                      dplyr::bind_rows(tibble::tibble(sid = sid))
  }

  return(current_series)
}

