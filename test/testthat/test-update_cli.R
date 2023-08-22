test_that("Convertir Argumentos a Lista de CLI", {

  option_list <- list(
    optparse::make_option("--periodo",      default = '2021-09-01' ,type='character' ,help='Periodo'),
    optparse::make_option("--trainsplit",   default = 0.8          ,type='double'    ,help='El split entre train y test'),
    optparse::make_option("--filtro",       default = FALSE        ,type='logical'   ,help='True si se aplica el filtro'),
    optparse::make_option("--accion",       default = 1            ,type='numeric'   ,help='La accion ha implementar, puede ser 1,2 o 3')
  )

  param_cli <- convert_to_cli(option_list)

  para_cli_manual <- "--periodo 2021-09-01 --trainsplit 0.8 --filtro FALSE --accion 1"

  testthat::test_that("Validar parametro cli",{   testthat::expect_identical(param_cli,para_cli_manual) })

  param_cli <- update_cli(param_cli,'periodo','2021-01-01')
  para_cli_manual <- "--periodo 2021-01-01 --trainsplit 0.8 --filtro FALSE --accion 1"

  testthat::test_that("Validar primer parametros",{   testthat::expect_identical(param_cli,para_cli_manual) })


  param_cli <- update_cli(param_cli,'trainsplit',0.2)
  para_cli_manual <- "--periodo 2021-01-01 --trainsplit 0.2 --filtro FALSE --accion 1"

  testthat::test_that("Validar segundo parametros",{   testthat::expect_identical(param_cli,para_cli_manual) })

  param_cli <- update_cli(param_cli,'filtro',TRUE)
  para_cli_manual <- "--periodo 2021-01-01 --trainsplit 0.2 --filtro TRUE --accion 1"

  testthat::test_that("Validar tercero parametros",{   testthat::expect_identical(param_cli,para_cli_manual) })


  param_cli <- update_cli(param_cli,'accion',2)
  para_cli_manual <- "--periodo 2021-01-01 --trainsplit 0.2 --filtro TRUE --accion 2"

  testthat::test_that("Validar tercero parametros",{   testthat::expect_identical(param_cli,para_cli_manual) })



})
