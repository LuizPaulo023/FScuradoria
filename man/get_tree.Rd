% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_tree.R
\name{get_tree}
\alias{get_tree}
\title{Árvore da FS}
\usage{
get_tree(
  master_node = as.character(),
  token = as.character(),
  url = as.character()
)
}
\arguments{
\item{master_node}{representa o nó mestre desejado}

\item{token}{representa o token \code{token};}
}
\description{
A função busca consultar a árvore FS
}
\details{
\code{master_node} além do parâmetro aceitar o nome de cada nó mestre desejado, há possibilidade de passar como parâmetro "all" para retornar todos os nós presentes na árvore da FS.
}
\examples{
\dontrun{

tree_fs = FScuradoria::get_tree(master_node = "Brazil",
                                token = token_to_use,
                                url = url_to_use)
}

}
\author{
Luiz Paulo Tavares Gonçalves
}
