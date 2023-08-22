#' @title Leer config
#'
#' @description  Leer archivo de configuracion yaml de snakemake y interpolar version. Si existe una variable llamada version en .env ocupara ese valor
#' @param yaml_path la ruta al archivo de configuracion
#'
#' @return Lista del archivo yaml con la interporlacion en version
#'
readConfig <- function(yaml_path) {
  config_string <- readLines(yaml_path)
  config <- yaml::yaml.load(config_string)

  # Check if .env file exists
  if (file.exists(".env")) {
    # Read the .env file and extract the version value if it exists
    env_vars <- readLines(".env")
    version_line <- grep("^version=", env_vars)
    if (length(version_line) > 0) {
      version_value <- gsub("^version=", "", env_vars[version_line])
      config$version <- version_value
    }
  }

  # Replace all occurrences of "{version}" with the value of config$version
  config <- gsub("\\{version\\}", config$version, yaml::as.yaml(config))

  # Parse the modified YAML string into a list
  config <- yaml::yaml.load(config)
  return(config)
}
