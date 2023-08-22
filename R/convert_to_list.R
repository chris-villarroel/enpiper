#' Parse Input Arguments to List
#'
#' This function parses command line arguments and their values
#' into a list, after applying a filter. The 'optparse' package is used
#' for argument parsing. Only arguments specified in 'argumentos' are processed.
#'
#' @param argumentos A list of command line arguments to process.
#'                   Each element should be an optparse option object.
#'
#' @return A list where the names are command line argument names and
#'         the values are the corresponding argument values. The returned list
#'         does not include the last command line argument.
#'
#' @examples
#' # Assume that the command line arguments are c("--arg1", "value1", "--arg2", "value2")
#' argumentos <- list(optparse::make_option(c("--arg1"), default = "default1"),
#'                    optparse::make_option(c("--arg2"), default = "default2"))
#' convert_to_list(argumentos)
#' # It will return: list(arg1 = "value1", arg2 = "value2")
#'
#' @importFrom optparse parse_args
#' @importFrom optparse OptionParser
#' @importFrom base return
#' @importFrom base length
#'
#' @export
convert_to_list <- function(argumentos)
{
  filtered_args <- convert_know_to_list(argumentos)

  l <- optparse::parse_args(
    optparse::OptionParser(option_list = argumentos),
    args = filtered_args
  )

  return(l[1:(length(l)-1)])
}
