#' @title Agregar argumento a una lista de argumento ya creada
#'
#' @description Agregar un argumento adicional a una lista de argumento ya creada que esta en formato OptionParserOption
#' @param argumentos Lista con todos los argumentos del proyecto.
#' @param nombre Nombre del argumento a agregar.
#' @param default Valor default que tendra el argumento
#' @param type La clase que tendra el argumento, esto puede ser: numeric, double, character, logical, integer
#' @param help Descripción del argumento. Debe ser proporcionado.
#'
#' @return Devuelve la lista de argumento en formato OptionParserOption con el argumento adicional.
#'
#' @examples
#' argumentos <- list()
#' argumentos <- add_arg(argumentos,"periodo"    ,default='2021-09-01' ,type="character" ,help="Fecha en formato yyyy-mm-dd")
#' argumentos <- add_arg(argumentos,"cantidad"   ,default=10           ,type="numeric"   ,help="Cantidad de elementos a procesar")
add_arg <- function(argumentos, nombre, default, type, help) {
  allowed_types <- c("numeric", "double", "character", "logical", "integer")

  if (!type %in% allowed_types) {
    stop(paste("Invalid type argument. Allowed types are: ", paste(allowed_types, collapse = ", ")))
  }

  if (!is.character(nombre) | length(nombre) == 0) {
    stop("Invalid nombre argument. It should be a non-empty string.")
  }

  if (missing(help) | !is.character(help) | length(help) == 0 |  help=="") {
    stop("Invalid help argument. It should be a non-empty string.")
  }

  argumentos <- append(argumentos,
                       optparse::make_option(
                         paste0("--", nombre),
                         default = default,
                         type = type,
                         help = help
                       ))

  return(argumentos)
}
