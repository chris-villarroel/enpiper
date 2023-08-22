#' Clean the workspace
#'
#' This function will remove all objects from your environment, 
#' delete any created plots, run the garbage collector, 
#' and clear the console messages.
#'
#' @return A message stating that the workspace was cleaned successfully.
#'
#' @examples
#' clean_workspace()
clean_workspace <- function() {
  # Removes the objects from the environment
  rm(list = ls())
  
  # Deletes the created plots
  graphics.off()
  
  # Activates the garbage collector
  gc()
  
  # Clears the messages from the console
  cat("\014")
  
  print("Workspace cleaned successfully.")
}
