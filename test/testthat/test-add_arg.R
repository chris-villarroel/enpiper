test_that("Validar si funciona el agregar argumentos adicional", {

  # Set up arguments
  argumentos <- list()
  argumentos <- add_arg(argumentos, "periodo", default = '2021-09-01', type = "character", help = "test")
  argumentos <- add_arg(argumentos, "trainsplit", default = 0.8, type = "double", help = "test")
  argumentos <- add_arg(argumentos, "filtro", default = FALSE, type = "logical", help = "test")
  argumentos <- add_arg(argumentos, "accion", default = 1, type = "numeric", help = "test")

  # Convert arguments to list
  param <- convert_to_list(argumentos)

  # Expected arguments
  param_manual <- list()
  param_manual$periodo <- '2021-09-01'
  param_manual$trainsplit <- 0.8
  param_manual$filtro <- FALSE
  param_manual$accion <- 1

  # Test that arguments match expected values
  expect_identical(param$periodo, param_manual$periodo, info = "Validar primer parametro")
  expect_identical(param$trainsplit, param_manual$trainsplit, info = "Validar segundo parametro")
  expect_identical(param$filtro, param_manual$filtro, info = "Validar tercero parametro")
  expect_identical(param$accion, param_manual$accion, info = "Validar cuarto parametro")

  # Add additional argument and convert to list
  argumentos <- add_arg(argumentos, "periodo_final", default = as.character(as.Date(get_args(argumentos,"periodo")) + 1), type = "character", help = "Periodo final es un dia despues del periodo")
  param <- convert_to_list(argumentos)

  # Test that the added argument matches the expected value
  expect_identical(param$periodo_final, "2021-09-02", info = "Validar periodo final")

  # Test that an error is thrown when invalid types are used
  expect_error(add_arg(argumentos, "invalid_type_arg", default = 123, type = "invalid_type", help = "test"), info = "Validar tipo de argumento inválido")

  # Test that an error is thrown when empty nombre is used
  expect_error(add_arg(argumentos, "", default = 123, type = "numeric", help = "test"), info = "Validar nombre de argumento vacío")

  # Test that an error is thrown when empty help is used
  expect_error(add_arg(argumentos, "empty_help", default = 123, type = "numeric", help = ""), info = "Validar ayuda de argumento vacía")
})
