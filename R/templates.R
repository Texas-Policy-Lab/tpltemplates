#' @title Copy template
#' @description Copies template files from www and the specified template directory
#' @param template_dir string. The name of the template dir to copy files from.
#' @export
copy_template <- function(pth,
                          template_dir,
                          ignore = "R/templates.R") {

  dirs <- c("R",
            "www",
            file.path("www", "css"),
            file.path("www", "js"),
            file.path("www", "images"),
            file.path("www", "svg")
  )

  lapply(dirs, function(dir, pth) dir.create(file.path(pth, dir)), pth = pth)

  fls <- c(list.files(template_dir, full.names = TRUE, recursive = TRUE),
           list.files(dirs, full.names = TRUE, recursive = TRUE))

  fls <- fls[grepl(ignore, fls) == FALSE]

  lapply(fls, function(fl, pth) {

           file.copy(from = fl,
                     to = file.path(pth, gsub(template_dir, ".", fl)))
    }, pth = pth)
}

#' @title Create dashboard
#' @description Creates an application set-up that includes TPL styles in the css folder
#' @param pth string. The path root directory of the application.
#' @export
create_dashboard <- function(pth,
                             template_dir = "app_template") {

  copy_template(pth = pth,
                template_dir = template_dir)
}

#' @title Create report
#' @description Creates a rmarkdown report set-up that includes TPL styles in the css folder
#' @param pth string. The path root directory of the application.
#' @export
create_report <- function(pth,
                          template_dir = "report_template") {

  copy_template(pth = pth,
                template_dir = template_dir)
}
