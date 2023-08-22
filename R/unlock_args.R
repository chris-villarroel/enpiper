#' Unlock Options List
#'
#' @param argumentos Lista de Argumento
#'
#' @return La lista de parametros bloqueada
#' @export
#'
#' @examples
unlock_args <- function(argumentos) {
  unlockBinding(deparse(substitute(argumentos)),as.environment(1))
}
