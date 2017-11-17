
#`@export
plotFigure <- function(figure, ...) {
  path <- getPath(figure)
  runDockerAndView(path)
}

getPath <- function(figure) {
  map <- makeMap()
  map[figure][[1]]
}

#returns a map of paths to each figures .rmd file
#for more analysis add their path to the list.
makeMap <- function() {
  list(figure1 = "analysis/weather.Rmd")
}

#runs liftr render_docker and opens the html output
runDockerAndView <- function(path) {
  sans_ext = tools::file_path_sans_ext
  
  rmdPath <- system.file(path, package = "reproducibleAnalysis")
  tmpPath <- moveToTmp(rmdPath)
  
  render_docker(file.path(tmpPath, basename(rmdPath)), cache = FALSE)
  print(tmpPath)
  
  htmlPath <- file.path(tmpPath, paste0(sans_ext(basename(rmdPath)), '.html'))
  browseURL(paste0('file://', htmlPath))
  #unlink(tmpPath, recursive = TRUE)
}

#runs lift and copies the .rmd file and Dockerfile to a tmp directory (due to
# the fact that liftr wants everything in the same directory)

moveToTmp <- function(rmdPath){
  tmpPath <- tempdir()
  
  #copy rmd
  sysCmd1 <- paste("cp", rmdPath, tmpPath, sep = " ")
  system(sysCmd1)
  
  #lift
  lift(
    input = system.file('docker/dummy.Rmd', package = "reproducibleAnalysis"),
    use_config = TRUE,
    config_file = 'liftr.yml',
    output_dir = system.file('docker', package = "reproducibleAnalysis")
  )
  
  #copy docker
  dockerPath <- system.file('docker/Dockerfile', package = "reproducibleAnalysis")
  sysCmd2 <- paste("cp", dockerPath, tmpPath)
  system(sysCmd2)
  
  return(tmpPath)
}
