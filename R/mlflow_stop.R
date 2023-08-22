#' Termina un RUN dentro de MLFLOw
#'
#' @param experiment_name Nombre del experimento, debe ser el nombre del proyecto
#' @param run_version Nombre que le vas a poner al run
#' @param mlflow_host IP donde esta alojado MLFLOW Server
#' @param port Puerto donde esta alojado MLFLOW Server
#'
#' @return Nada
#'
mlflow_stop <- function(experiment_name,run_name,mlflow_host='',port='') {

  param_global <- pipe::mlflow_start(experiment_name,run_name,mlflow_host,port)
  mlflow::mlflow_end_run(run_id = param_global$mlflow_run_id)


}
