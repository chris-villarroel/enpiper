test_that("Load Global Parameters from a File", {

  # Define the path of the file to source
  file_path <- system.file("extdata", "test_script.R", package = "pipe")

  # Define some parameters to load
  parameters <- list(a = 1, b = 2)

  # Run the function with the file path and parameters
  global_params <- get_paramGlobal(file_path, parameters)

  # Check that the function correctly loaded the parameters
  expect_equal(global_params$a, parameters$a)
  expect_equal(global_params$b, parameters$b)

  # Check that the function correctly sourced the file and loaded 'x'
  expect_equal(global_params$x, 10)

  # Run the function with the file path and without any parameters
  global_params <- get_paramGlobal(file_path)

  # Check that the function correctly sourced the file and loaded 'x'
  expect_equal(global_params$x, 10)

  # Check that 'a' and 'b' are not present, as no additional parameters were loaded
  expect_null(global_params$a)
  expect_null(global_params$b)
})
