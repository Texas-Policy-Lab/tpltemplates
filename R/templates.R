list_files <- function(template_dir,
                       dirs, 
                       ignore = "R/templates.R") {
  
  fls <- c(list.files(template_dir, full.names = TRUE, recursive = TRUE),
           list.files(dirs, full.names = TRUE, recursive = TRUE))
  
  fls <- fls[grepl(ignore, fls) == FALSE]
  
}

#' @title Create dashboard
#' @description Creates an application set-up that includes TPL styles in the css folder
#' @param pth string. The path root directory of the application.
#' @export
create_dashboard <- function(pth,
                             template_dir = "app_template",
                             dirs = list.dirs(c("R", "www"))) {

  lapply(dirs, function(dir, pth) dir.create(file.path(pth, dir)), pth = pth)
  
  fls <- list_files(template_dir = template_dir,
                    dirs = dirs)

  lapply(fls, function(fl, pth) {
    
    file.copy(from = fl,
              to = file.path(pth, 
                             gsub(template_dir, ".", fl))
    )
  }, pth = pth)
}

#' @title Create report
#' @description Creates a rmarkdown report set-up that includes TPL styles in the css folder
#' @param pth string. The path root directory of the application.
#' @export
create_report <- function(pth,
                          template_dir = "report_template",
                          dirs = list.dirs(c("R", "www"))) {

  dirs_special <- c("R", "css", "js", "images", "svg")

  lapply(dirs_special, function(dir, pth) dir.create(file.path(pth, dir)), pth = pth)

  fls <- list_files(template_dir = template_dir,
                    dirs = dirs)

  lapply(fls, function(fl, pth) {
    
    file.copy(from = fl,
              to = file.path(pth, 
                             gsub(paste(template_dir, "www", sep = "|"), ".", fl))
    )
  }, pth = pth)
}
