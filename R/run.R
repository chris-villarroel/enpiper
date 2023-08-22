#' @title Execute Scripts via Command Line
#'
#' @description Executes scripts via the command line using the specified program.
#' @param programa Program to use for executing the script. It can be 'Rscript', 'python3', or the path to a Python virtual environment's Python interpreter (e.g., 'venv/bin/python').
#' @param archivo Path to the file to be executed.
#' @param param Parameters in CLI format obtained from `convert_to_cli()`.
#' @param title Title of the script being executed.
#'
#' @return Executes the script and prints the executed code.
#'
#' @examples
#' run("Rscript", "script.R", "--param1 value1 --param2 value2", "My Script")
run <- function(programa, archivo, param, title = "Script") {
  print(paste0("Ejecutando: ", title))
  tictoc::tic()

  if (is.list(param)) {
    param_cli <- convert_to_cli(param)
  } else if (is.character(param)) {
    param_cli <- param
  } else {
    stop("Param must be a list or a string of CLI parameters.")
  }

  texto <- paste(programa, archivo, param_cli)

  print(texto)
  try(system(texto))

  print(paste0("Fin del Script '", title, "', tiempo de ejecucion: "))
  tictoc::toc()
}
