test_that("Lock Arguments Function Test", {
  # Define the arguments in the global environment
  argumentos <<- list(a = 1, b = "two", c = TRUE)

  # Call the lock_args function on argumentos
  lock_args("argumentos")

  # Store the original arguments
  original_args <- argumentos

  # Try to modify the arguments
  tryCatch({
    argumentos$a <- 2
  }, error = function(e) {
    # If an error occurs, this means the modification was unsuccessful, which is expected
    expect_true(TRUE)
  })

  # The arguments should remain the same
  expect_identical(argumentos, original_args)
})
