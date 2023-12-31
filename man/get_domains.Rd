% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_domains.R
\name{get_domains}
\alias{get_domains}
\title{Importando os domínios (domains) da FS}
\usage{
get_domains(token = as.character(), url = as.character())
}
\arguments{
\item{token}{representa o token \code{token};}

\item{url}{representa a url \code{url}}
}
\description{
A função busca consultar os Domínios da FS
}
\examples{
\dontrun{

  db_fs = get_domains(token = token_to_use, url = url_to_use)

}

}
\author{
Luiz Paulo Tavares Gonçalves
}
