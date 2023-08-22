test_that("convert_know_to_list correctly filters arguments", {
  # Mock commandArgs to return a specific value
  mock_commandArgs <- function(trailingOnly = FALSE) {
    return(c("--arg1", "val1", "--arg2", "val2", "--unexpected", "val_unexpected"))
  }

  withr::with_mock(
    commandArgs = mock_commandArgs,
    {
      # Test
      argumentos <- list(
        optparse::make_option("--arg1", default = 'val1' ,type='character' ,help='arg1'),
        optparse::make_option("--arg2", default = 'val2' ,type='character' ,help='arg2')
      )

      filtered_args <- convert_know_to_list(argumentos)

      # Validate
      expect_equal(filtered_args, c("--arg1", "val1", "--arg2", "val2"))
    }
  )
})
