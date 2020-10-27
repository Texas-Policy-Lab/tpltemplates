#' @title Create dashboard
#' @description Creates an application set-up that includes TPL styles in the css folder
#' @param pth string. The path root directory of the application.
#' @export
create_dashboard <- function(pth) {

  dirs <- c("R",
            "www",
            file.path("www", "css"),
            file.path("www", "js"),
            file.path("www", "images"),
            file.path("www", "svg")
            )
  
  fls <- c("dashboard.yaml", "global.R", "server.R", "ui.R")
  
  lapply(dirs, function(dir, pth) dir.create(file.path(pth, dir)), pth = pth)
  
  lapply(c(fls, list.files(dirs, full.names = T)),
         function(fl, pth) {
           file.copy(from = fl, to = file.path(pth, fl))}, pth = pth)

}

#' @title Create report
#' @description Creates a rmarkdown report set-up that includes TPL styles in the css folder
#' @param pth string. The path root directory of the application.
#' @export
create_report <- function() {
  
  
  
  
}