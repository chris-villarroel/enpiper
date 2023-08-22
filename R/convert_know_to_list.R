#' Convert Input Arguments to List
#'
#' This function converts named command line arguments into a list
#' where each element is a command line argument and its value.
#' Only the arguments specified in 'argumentos' are returned.
#' The function uses packages 'magrittr' and 'purrr'.
#'
#' @param argumentos A list of command line arguments to look for.
#'                   Each element should be an object with a '@long_flag' property,
#'                   indicating the name of the argument.
#'
#' @return A vector of command line arguments and their values
#'         for those specified in 'argumentos'.
#'
#' @examples
#' # Assume that the command line arguments are c("--arg1", "value1", "--arg2", "value2")
#' argumentos <- list(arg1 = list("@long_flag" = "--arg1"), arg2 = list("@long_flag" = "--arg2"))
#' convert_know_to_list(argumentos)
#' # It will return: c("--arg1", "value1", "--arg2", "value2")
#'
#' @importFrom magrittr %>%
#' @importFrom purrr map
#' @importFrom base commandArgs
#' @importFrom base which
#' @importFrom base unlist
#' @importFrom base sort
#' @importFrom base unique
#' @importFrom base c
#' @importFrom base return
#'
#' @export
convert_know_to_list <- function(argumentos) {
  require(magrittr)

  command_args <- commandArgs(trailingOnly = TRUE)

  expected_args <- purrr::map(argumentos, function(x) x@long_flag) %>% unlist(recursive = FALSE, use.names = FALSE)

  expected_indices <- which(command_args %in% expected_args)
  expected_and_values_indices <- sort(unique(c(expected_indices, expected_indices + 1)))

  return(command_args[expected_and_values_indices])
}
