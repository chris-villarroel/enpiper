#' Modifica un valor de un parametros en el formato CLI
#'
#' @param param_cli String con los parametros en formato Cli.
#' @param key Nombre del parametro a modificar.
#' @param value Nuevo valor para el parametro a modificar.
#'
#' @return String de los parametros en formato CLI con la modificacion deseada
#'
#' @examples
#'  option_list <- list(
#'optparse::make_option("--periodo",      default = '2021-09-01' ,type='character' ,help='Periodo'))
#' )
#' param_cli <- convert_to_cli(option_list)
#' param_cli <- update_cli(param_cli,'periodo','2021-01-01')
update_cli <- function(param_cli,key,value) {

  `%>%` <- magrittr::`%>%`


  if ( (strsplit(param_cli,"--")[[1]] %>% stringr::str_detect(key) %>% which()) == length(strsplit(param_cli,"--")[[1]]) ) {
    param_cli <- stringr::str_replace(param_cli,paste0('--',key,' .$' ),paste0('--',key,' ',value,'') )
  } else {
    param_cli <- stringr::str_replace(param_cli,paste0('--',key,' (?<=\\s)(.*?)(?=\\s) --'),paste0('--',key,' ',value,' --') )
  }

  return(param_cli)

}

