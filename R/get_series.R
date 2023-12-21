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

get_sids <- function(url, token, indicators){

  all_series <- tibble()# para preenchimento

  for (indicator in indicators) {
    get_fs <- httr::VERB("GET",
                         url = paste0(url, "api/v1/indicators/", indicator, "/series?limit=3000"),
                         add_headers(token)) %>%
      httr::content("parsed")

    current_series <- tibble()
    for (i in seq_along(get_fs[["data"]])) {
      current_code <- get_fs[["data"]][[i]][["code"]]
      current_series <- dplyr::bind_rows(current_series,
                                         tibble(code = current_code))
    }

    all_series <- dplyr::bind_rows(all_series, current_series)
  }

  return(all_series)  # Retorna o data frame com todas as séries
}
