test_that("Convert Command Line Arguments to Parameter List", {

  # Define the command line arguments
  argumentos <- list(
    optparse::make_option("--periodo", default = '2021-09-01', type = 'character', help = 'Periodo'),
    optparse::make_option("--trainsplit", default = 0.8, type = 'double', help = 'El split entre train y test'),
    optparse::make_option("--filtro", default = FALSE, type = 'logical', help = 'True si se aplica el filtro'),
    optparse::make_option("--accion", default = 1, type = 'numeric', help = 'La accion ha implementar, puede ser 1,2 o 3')
  )

  # Convert the list of command line arguments to a list of parameter-value pairs
  param <- convert_to_list(argumentos)

  # Manually create the expected parameter-value list
  param_manual <- list(
    periodo = '2021-09-01',
    trainsplit = 0.8,
    filtro = FALSE,
    accion = 1
  )

  # Test if the function correctly converts the parameters
  expect_identical(param$periodo, param_manual$periodo)
  expect_identical(param$trainsplit, param_manual$trainsplit)
  expect_identical(param$filtro, param_manual$filtro)
  expect_identical(param$accion, param_manual$accion)
})
