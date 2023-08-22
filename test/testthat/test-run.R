library(testthat)

# Define a test case for the run() function
test_that("Execute Scripts via Command Line", {
  # Specify the command-line program, script file, parameters, and title
  programa <- "Rscript"
  archivo <- "Rscript.R"
  param <- list(
    optparse::make_option("--param1", default = "value1", type = "character", help = "Parameter 1"),
    optparse::make_option("--param2", default = "value2", type = "character", help = "Parameter 2")
  )
  title <- "My Script"

  # Capture the output of the run() function
  output <- capture_output(run(programa, archivo, param, title))

  # Verify that the expected text is present in the output
  expect_match(output[1], "Ejecutando: My Script")
  expect_match(output[length(output)], "Fin del Script 'My Script', tiempo de ejecucion:")
})
