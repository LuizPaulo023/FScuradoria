#' @title Selecionando series para delete
#' @name delete_select
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
#' }
#'
#' @export

# indicator = "BRGDP0081"

delete_select <- function(indicator = as.character(),
                          new_sids = as.character(),
                          token = as.character(),
                          url = as.character()) {

  metadados_series <- FScuradoria::get_metadados_series(indicator = indicator, token = token_to_use, url = url_to_use)

  if(metadados_series$total %>% is.null()) {
    return(character(0))
  }

  current_series <- FScuradoria::get_clean_sids(metadados_series) %>% purrr::pluck('sid')
  del_series <- current_series[!(current_series %in% new_sids$sid)]

  return(del_series)
}
