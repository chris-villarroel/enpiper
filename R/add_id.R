#' @title Crear Identificador de la Iteración
#'
#' @description Agregar un argumento a la lista de argumento un identificador que es la concatenacion de los otros argumentos.
#' Este nuevo argumento puede ser utilizado al momento de grabar los archivos con nombres unicos
#' @param argumentos Lista con todos los argumentos del proyecto en formato OptionParserOption
#' @param excluir Lista con los nombres de los parametros (string) a excluir en la generación del identificador
#' @param nombre Nombre del argumento identificador.
#'
#' @return Se agrega a la lista de argumentos el identificador
#'
#' @examples
#' argumentos <- list(
#'   optparse::make_option("--periodo",      default = '2021-09-01' ,type='character' ,help='Periodo'),
#'   optparse::make_option("--trainsplit",   default = 0.8          ,type='double'    ,help='El split entre train y test'),
#'   optparse::make_option("--filtro",       default = FALSE        ,type='logical'   ,help='True si se aplica el filtro'),
#'   optparse::make_option("--accion",       default = 1            ,type='numeric'   ,help='La accion ha implementar, puede ser 1,2 o 3')
#' )
#' argumentos <- add_id(argumentos)
#'
add_id <- function(argumentos, excluir = "", nombre = "identificador") {
  long_flags <- sapply(argumentos, function(x) substr(x@long_flag, 3, nchar(x@long_flag)))
  excluir <- c(excluir, nombre)

  id_value <- paste0(rlist::list.remove(convert_to_list(argumentos), excluir), collapse = '_')
  id_option <- optparse::make_option(sprintf("--%s", nombre), default = id_value, type = "character", help = "Se modifica internamente")

  if (nombre %in% long_flags) {
    argumentos[[which(long_flags == nombre)]]@default <- id_value
  } else {
    argumentos <- append(argumentos, id_option)
  }

  return(argumentos)
}
