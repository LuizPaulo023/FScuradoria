#' @title Importando os domínios (domains) da FS
#' @name get_domains
#'
#' @description A função busca consultar os Domínios da FS
#'
#' @param token representa o token \code{token};
#' @param url representa a url \code{url}
#'
#' @author Luiz Paulo Tavares Gonçalves
#'
#' @details
#'
#' @examples
#' \dontrun{
#'
#'   db_fs = get_domains(token = token_to_use, url = url_to_use)
#'
#' }
#'
#' @export

get_domains <- function(token = as.character(), url = as.character()){

  httr::VERB("GET", url = paste0(url, 'api/v1/domains'), add_headers(token)) %>%
  httr::content("parsed")

}


