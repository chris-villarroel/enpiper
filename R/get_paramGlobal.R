#' Load Global Parameters from a File
#'
#' This function sources an R script from a specified file and loads the global parameters contained in it.
#' If an additional list of parameters is provided, these are also loaded into the environment before sourcing the file.
#'
#' @param archivo The path to the R script file to source.
#' @param param An optional list of additional parameters to load into the environment before sourcing the file.
#'
#' @return A list of all objects loaded into the environment by sourcing the file and by the param argument.
#' @examples
#' # Define the file path and parameters
#' file_path <- system.file("extdata", "myscript.R", package = "myPackage")
#' parameters <- list(var1 = 1, var2 = 2)
#'
#' # Load the global parameters
#' global_params <- get_paramGlobal(file_path, parameters)
#' print(global_params)
#'
#' @export
get_paramGlobal <- function(archivo, param = NULL) {
  # Create a new local environment
  local_env <- new.env()

  # If 'param' argument is provided, assign it to the local environment
  if (!is.null(param)) {
    assign('param', param, envir = local_env)
  }

  # Source the script file into the local environment
  source(file = archivo, local = local_env)

  # Convert the local environment to a list and return
  lista_param <- as.list(local_env)

  return(lista_param)
}
