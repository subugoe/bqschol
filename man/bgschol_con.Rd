% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/connect.R
\name{bgschol_con}
\alias{bgschol_con}
\title{Create connection}
\usage{
bgschol_con(
  project = "subugoe-collaborative",
  dataset = "cr_instant",
  path = NULL
)
}
\arguments{
\item{project}{Big Query project. Default is \code{subugoe-collaborative}.}

\item{dataset}{big scholarly datasets. Currently the
following datasets are present in  \code{subugoe-collaborative}:
\itemize{
\item \emph{cr_instant} Most recent monthly Crossref metadata snapshot,
comprising metadata about journal articles published since 2008.
\item \emph{cr_history} Historic Crossref metadata snapshots starting Apr
2018.
\item \emph{upw_instant} Most recent Unpaywall metadata since 2008.
\item \emph{upw_history} Historic Unpaywall metadata.
\item \emph{resources}: Authorative data like journal lists
}}

\item{path}{Path to JSON identifying the associated service account.}
}
\description{
Interactive authorization or through a service account token.
}
\concept{connection}
