# Create base arguments once
base_arguments <- list(
  optparse::make_option("--periodo",    default = '2021-09-01' ,type='character' ,help='Periodo'),
  optparse::make_option("--trainsplit", default = 0.8          ,type='double'    ,help='El split entre train y test'),
  optparse::make_option("--filtro",     default = FALSE        ,type='logical'   ,help='True si se aplica el filtro'),
  optparse::make_option("--accion",     default = 1            ,type='numeric'   ,help='La accion ha implementar, puede ser 1,2 o 3')
)

# Test for Validar identificador 1
test_that("Validar identificador 1", {
  argumentos <- base_arguments
  argumentos <- add_id(argumentos)
  param <- convert_to_list(argumentos)
  expect_identical(param$identificador, "2021-09-01_0.8_FALSE_1")
})

# Test for Validar identificador 2
test_that("Validar identificador 2", {
  argumentos <- base_arguments
  argumentos <- add_id(argumentos, 'accion')
  param <- convert_to_list(argumentos)
  expect_identical(param$identificador, "2021-09-01_0.8_FALSE")
})

# Test for Validar identificador 3
test_that("Validar identificador 3", {
  argumentos <- base_arguments
  argumentos <- add_id(argumentos, 'periodo')
  param <- convert_to_list(argumentos)
  expect_identical(param$identificador, "0.8_FALSE_1")
})
