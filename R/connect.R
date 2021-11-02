#' Create connection
#'
#' Interactive authorization or through a service account token.
#'
#' @param project Big Query project. Default is `subugoe-collaborative`.
#'
#' @param dataset big scholarly datasets. Currently the
#'  following datasets are present in  `subugoe-collaborative`:
#'  - *cr_instant* Most recent monthly Crossref metadata snapshot,
#'    comprising metadata about journal articles published since 2008.
#'  - *cr_history* Historic Crossref metadata snapshots starting Apr
#'    2018.
#'  - *upw_instant* Most recent Unpaywall metadata since 2008.
#'  - *upw_history* Historic Unpaywall metadata.
#'  - *resources*: Authorative data like journal lists
#'
#' @param path Path to JSON identifying the associated service account.
#'
#' @family connection
#' @export
bgschol_con <- function(project = "subugoe-collaborative",
                        dataset = "cr_instant", path = NULL) {
    # authorize through service account
    bgschol_auth(path = path)
    # check if project is accessible
    stopifnot(
        project %in% bigrquery::bq_projects()
    )
    # check if dataset is available
    stopifnot(
        bigrquery::bq_dataset_exists(
            bgschol_dataset(project = project, dataset = dataset)
            )
        )
    # create DBI connection
    DBI::dbConnect(bigrquery::bigquery(),
                   project = project,
                   dataset = dataset)
}


#' Authorize connection
#'
#' Authorize bigrquery to view and manage big scholarly databases
#' on Google Big Query maintained by SUB Göttingen. Authorization
#' is only possible through a service account token. It can be
#' requested from Najko <mailto:najko.jahn@sub.uni-goettingen.de>
#'
#'
#' @noRd
bgschol_auth <- function(path = NULL) {
    if (is.null(path))
        bigrquery::bq_auth()
    else
        bigrquery::bq_auth(path = path)
}

#' Create reference to Big Query datasets.
#'
#' @noRd
bgschol_dataset <- function(project = project,
    dataset = dataset) {
    bigrquery::bq_dataset(project = project, dataset = dataset)
}
