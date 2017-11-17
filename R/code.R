
#' subsetPrecip
#'
#' @name subsetPrecip
#' @rdname subsetPrecip
#' @aliases subsetPrecip
#' @param data data frame; The weather data frame.
#' @author Jason T. Serviss
#'
NULL

#' @rdname subsetPrecip
#' @export
#' @importFrom dplyr filter

subsetPrecip <- function(data) {
    filter(data, precip != 0)
}
