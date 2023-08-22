test_that("Convert Command Line Arguments to String", {
  # Define the command line arguments
  argumentos <- list(
    optparse::make_option("--periodo", default = '2021-09-01', type = 'character', help = 'Periodo'),
    optparse::make_option("--trainsplit", default = 0.8, type = 'double', help = 'El split entre train y test'),
    optparse::make_option("--filtro", default = FALSE, type = 'logical', help = 'True si se aplica el filtro'),
    optparse::make_option("--accion", default = 1, type = 'numeric', help = 'La accion ha implementar, puede ser 1,2 o 3')
  )

  # Convert arguments to command line format
  param_cli <- convert_to_cli(argumentos)

  # Convert command string to list for easy testing
  param_cli_list <- strsplit(param_cli, " ")[[1]]

  # Test if the function correctly converts the arguments
  expect_identical(param_cli_list[1:2], c("--periodo", "2021-09-01"))
  expect_identical(param_cli_list[3:4], c("--trainsplit", "0.8"))
  expect_identical(param_cli_list[5:6], c("--filtro", "FALSE"))
  expect_identical(param_cli_list[7:8], c("--accion", "1"))
})
