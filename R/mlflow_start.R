#' Empieza una experimentación en MLFLOW
#'
#' @param experiment_name Nombre del experimento, debe ser el nombre del proyecto
#' @param run_name Nombre que le vas a poner al run
#' @param mlflow_host IP donde esta alojado MLFLOW Server
#' @param port Puerto donde esta alojado MLFLOW Server
#'
#' @return Una lista con el ID del experimento y el ID del run
#'
mlflow_start <- function(experiment_name, run_name, mlflow_host, port , bucket) {


  # Initial Configuration
  `%>%` <- magrittr::`%>%`

  # Global Parameters
  param_global <- list()
  param_global$mlflow_experiment_name <- experiment_name
  param_global$mlflow_run_name_tag <- run_name

  # Connect to MLflow Tracking
  mlflow::mlflow_set_tracking_uri(paste0("http://", mlflow_host, ":", port))

  # Create Experiment if it doesn't exist
  param_global$experiment_id <- tryCatch({
    mlflow::mlflow_get_experiment(name = param_global$mlflow_experiment_name)$experiment_id
  }, error = function(e) {
    mlflow::mlflow_create_experiment(param_global$mlflow_experiment_name, artifact_location = paste0('s3://', bucket, '/', experiment_name, '/files/mlflow/'))
  })

  # Create Run if it doesn't exist
  info_run <- tryCatch({
    mlflow::mlflow_start_run(run_id = mlflow::mlflow_search_runs(paste0("tags.version='", param_global$mlflow_run_name_tag, "'"), experiment_ids = param_global$experiment_id) %>% dplyr::filter(status == 'RUNNING') %>% head(1) %>% .$run_uuid)
  }, error = function(e) {
    tryCatch({
      mlflow::mlflow_start_run(experiment_id = param_global$experiment_id)
    }, error = function(e) {
      tryCatch({
        mlflow::mlflow_search_runs(paste0("tags.version='", param_global$mlflow_run_name_tag, "'"), experiment_ids = param_global$experiment_id) %>% dplyr::filter(status == 'RUNNING') %>% head(1)
      }, error = function(e) {
        mlflow::mlflow_end_run()
        mlflow::mlflow_start_run(experiment_id = param_global$experiment_id)
      })
    })
  })

  # If no active Run is found
  if (nrow(info_run) == 0) {
    info_run <- mlflow::mlflow_start_run(experiment_id = param_global$experiment_id)
  }

  # Set Run Version Tag
  mlflow::mlflow_set_tag('version', param_global$mlflow_run_name_tag, run_id = mlflow::mlflow_id(info_run))

  print(info_run)
  # Set Run ID
  info_run
}
