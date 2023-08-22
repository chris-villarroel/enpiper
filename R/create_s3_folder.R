#' Check and Create S3 Folder and Symlink
#'
#' This function checks if a directory (reflecting an S3 bucket folder)
#' exists in a specified local path. If the directory doesn't exist, the 
#' function will create it and a dummy object in the S3 bucket to reflect 
#' the new folder. It will then create a symlink from the directory to "files"
#' in the current working directory.
#'
#' @param bucket A character string specifying the name of the S3 bucket.
#' @param folder A character string specifying the name of the S3 bucket folder.
#'
#' @return No return value, called for side effects.
#' @export
#'
#' @examples
#' \dontrun{
#' check_and_create_s3_folder(bucket = "my-bucket", folder = "my-folder")
#' }
check_and_create_s3_folder <- function(bucket, folder) {
  # Construct the full path
  path <- paste0("/mnt/", bucket)

  # Check if the bucket mount directory is an S3 mount point
  mount_info <- system(paste("mount | grep", path), intern = TRUE)
  if (!grepl("s3", mount_info)) {
    stop(paste(path, "is not an S3 mount point. Please mount the bucket first."))
  }
  
  path <- paste0(path, "/", folder)
  # Check if the directory already exists
  if (!dir.exists(path)) {
    # If it does not exist, create the directory
    dir.create(path, recursive = TRUE)
    
    # Create dummy object in S3 to reflect the new folder
    put_object(
      object = "",
      object_key = paste0(folder, "/.dummy"),
      bucket = bucket
    )
  }

  # Now that the local directory is ensured to exist, create the symlink
  # Note: This must be done outside R in the system shell, and only works on Unix-like systems
  system(paste("ln -s", path, "files"))
}