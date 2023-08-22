# First, install and load the testthat package.
# install.packages("testthat")  # Uncomment this line if you need to install the package
library(testthat)

test_that("clean_workspace prints the correct message", {
  # Capture the output of the clean_workspace function
  output <- capture.output(clean_workspace())
  
  # Check that the last element of the output vector is the expected message
  expect_equal(output[length(output)], "Workspace cleaned successfully.")
})
