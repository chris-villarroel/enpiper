test_that("Validate functionality of adding and retrieving arguments", {

  argumentos <- list()
  argumentos <- add_arg(argumentos, "periodo", default = '2021-09-01', type = "character", help = "test")
  argumentos <- add_arg(argumentos, "trainsplit", default = 0.8, type = "double", help = "test")
  argumentos <- add_arg(argumentos, "filtro", default = FALSE, type = "logical", help = "test")
  argumentos <- add_arg(argumentos, "accion", default = 1, type = "numeric", help = "test")

  expect_identical(get_args(argumentos, 'periodo'), "2021-09-01")
  expect_identical(get_args(argumentos, 'trainsplit'), 0.8)
  expect_identical(get_args(argumentos, 'filtro'), FALSE)
  expect_identical(get_args(argumentos, 'accion'), 1)

  # Test to ensure proper error is raised when trying to get an argument that doesn't exist
  expect_error(get_args(argumentos, 'nonexistent'), sprintf("Argument '%s' not found in the provided arguments.", 'nonexistent'))


})
