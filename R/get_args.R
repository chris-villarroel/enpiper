#' Get Value of a Specific Argument
#'
#' This function takes a list of parameters and their values (or a list of
#' optparse options) and returns the value of a specific parameter.
#'
#' @param argumentos A list of parameters and their values, or a list of optparse options.
#' @param nombre The name of the parameter whose value is to be retrieved.
#'
#' @return The value of the requested parameter.
#'
#' @examples
#' argumentos <- list(
#'   optparse::make_option("--periodo", default = '2021-09-01', type='character', help='Periodo'),
#'   optparse::make_option("--trainsplit", default = 0.8, type='double', help='El split entre train y test')
#' )
#' get_args(argumentos,'periodo')
#'
#' @importFrom optparse make_option
#'
#' @export
get_args <- function(argumentos, nombre) {
  if (isS4(argumentos[[1]])) {
    param <- convert_to_list(argumentos)
  } else {
    param <- argumentos
  }

  if (!nombre %in% names(param)) {
    stop(sprintf("Argument '%s' not found in the provided arguments.", nombre))
  }

  if (is.null(param[[nombre]])) {
    return(NULL)  # return NULL if the default value of the argument is NULL
  }

  param[[nombre]]
}


