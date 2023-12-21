#' @title Deletando aberturas/transformações para a FS
#' @name delete_series
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

delete_series <- function(indicator = as.character(),
                          del_series = as.character(),
                          token = as.character(),
                          url = as.character()){

  result = tibble::tibble(out = c())

  for (sid in del_series) {

    delete_series <- httr::VERB("DELETE",
                                url = paste0(url, "api/v1/indicators/",
                                indicator,
                                "/series/",
                                sid),add_headers(token))

    result <- result %>%
              dplyr::bind_rows(tibble::tibble(out = delete_series$status_code))

    base::print(sid)
    base::cat(httr::content(delete_series, 'text'))
    base::Sys.sleep(0.05)
  }

  if(any(!(result$out %in% c(200, 404)))) {
    stop('problema no envio')
  }
}
