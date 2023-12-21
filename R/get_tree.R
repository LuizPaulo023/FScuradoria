#' @title Árvore da FS
#' @name get_tree
#'
#' @description A função busca consultar a árvore FS
#'
#' @param token representa o token \code{token};
#' @param master_node representa o nó mestre desejado
#'
#' @author Luiz Paulo Tavares Gonçalves
#'
#' @details
#'
#' \code{master_node} além do parâmetro aceitar o nome de cada nó mestre desejado, há possibilidade de passar como parâmetro "all" para retornar todos os nós presentes na árvore da FS.
#'
#' @examples
#' \dontrun{
#'
#' tree_fs = FScuradoria::get_tree(master_node = "Brazil",
#'                                 token = token_to_use,
#'                                 url = url_to_use)
#' }
#'
#' @export

get_tree <- function(master_node = as.character(),
                     token = as.character(),
                     url = as.character()){

  domains_fs = FScuradoria::get_domains(token = token_to_use, url = url_to_use)

  tree = domains_fs[["tree"]] # Puxando apenas árvore da lista
  # Filter master_node \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  number_node = tree %>%
                purrr::map_df(function(index)
                                      {dplyr::tibble(node = index$node)}) %>%
                dplyr::mutate(n = 1:length(tree)) %>%
                dplyr::filter(node == master_node) %>%
                dplyr::select(n)

  tree = base::data.frame(tree = cbind(tree))[[1]][[number_node$n]]


  return(tree)

}





