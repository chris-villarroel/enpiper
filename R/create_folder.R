#' Create folder structure for a project
#'
#' This function creates a specified folder structure within a project directory.
#'
#' @examples
#' \dontrun{
#'   create_folders()
#' }
create_folders <- function() {
  #' @description
  #'  Create the following directories under "files":
  #'  
  #'  "datasets/input",
  #'  "datasets/intermedia",
  #'  "datasets/output",
  #'  "models",
  #'  "execution",
  #'  "insight",
  #'  "report"

  base_dir <- "files"
  subdirs <- c("datasets/input",
               "datasets/intermedia",
               "datasets/output",
               "models",
               "execution",
               "insight",
               "report")

  # Check if base_dir exists
  if(!dir.exists(base_dir)) {
    warning("The base directory 'files' does not exist.")
    return()
  }
  
  # Check if base_dir is a symlink
  if (!file_test("-h", base_dir)) {
    warning("The base directory 'files' is not a symbolic link.")
    return()
  }
  
  # Create each subdirectory
  #' @details
  #'  Then it goes through each of the subdirectories specified, checks if they exist, and creates them if they do not. 
  #'  The recursive = TRUE argument to dir.create allows it to create multiple levels of directories at once.
  for (subdir in subdirs) {
    full_path <- file.path(base_dir, subdir)
    if (!dir.exists(full_path)) {
      dir.create(full_path, recursive = TRUE)
    }
  }
}
