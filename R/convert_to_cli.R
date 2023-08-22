#' Convert Parameter List to Command Line Arguments String
#'
#' This function takes a list of parameters and their values and converts
#' them into a single string that can be used as command line arguments.
#' If the input is a list of optparse options, it first converts these options
#' to a list of parameters and their values using the 'convert_to_list' function.
#'
#' @param argumentos A list of parameters and their values, or a list of optparse options.
#'
#' @return A string with the parameters formatted as command line arguments.
#'
#' @examples
#' argumentos <- list(
#'   optparse::make_option("--periodo", default = '2021-01-01', type='character', help='Periodo'),
#'   optparse::make_option("--trainsplit", default = 0.8, type='double', help='El split entre train y test')
#' )
#' param_cli <- convert_to_cli(argumentos)
#'
#' @importFrom optparse make_option
#' @importFrom purrr map2
#' @importFrom magrittr %>%
#' @importFrom base unlist
#' @importFrom base paste0
#' @importFrom base names
#'
#' @export
convert_to_cli <- function(argumentos) {

  if (isS4(argumentos[[1]])) {
    param <- convert_to_list(argumentos)
  } else {
    param <- argumentos
  }

  purrr::map2(param, names(param), function(valor,nombre) paste0('--', nombre, ' ', valor)) %>%
    unlist(F,F) %>%
    paste0(collapse = " ")
}
