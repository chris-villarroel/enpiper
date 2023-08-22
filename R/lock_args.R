#' Block Modification of the List of Arguments
#'
#' @description This function will block any modification to the global variable that is passed to it.
#' @param arg_name Name of the argument to block. This must be a string with the name of the global variable.
#'
#' @return Nothing, but the global variable with name matching arg_name will be locked from modification.
#'
#' @examples
#' argumentos <- list(a = 1, b = 2)
#' lock_args("argumentos")
lock_args <- function(arg_name) {
  lockBinding(arg_name, .GlobalEnv)
}
