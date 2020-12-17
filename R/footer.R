#' @title TPL star
#' @description Creates a red svg star
#' @export
tpl_star <- function(svg = "tpl_star_red.svg") {
  
  htmltools::tags$div(class = "star",
                      htmltools::HTML(
                        paste(
                          readLines(file.path("svg", svg)),
                          collapse = '\n')
                      )
  )
}

#' @title TPL Logo
#' @description Creates the TPL color logo
#' @export
tpl_logo <- function(svg = "tpl_text_logo_color.svg") {
  
  htmltools::tags$div(class = "footer_logo",
                      htmltools::HTML(
                        paste(
                          readLines(file.path("svg", svg)),
                          collapse = '\n')
                      )
  )
}

#' @title Copyright
#' @description Copyrights the product to TPL with the correct year
#' @export
copyright <- function(tpl_url = "https://www.texaspolicylab.org/") {
  
  htmltools::tags$div(class="footer_copyright"
                      ,htmltools::tags$p(
                        htmltools::tags$strong(
                          htmltools::HTML(paste("Copyright"
                                                ,format(Sys.Date(), "%Y")
                                                ,htmltools::tags$a(href = tpl_url,
                                                                   "Texas Policy Lab")
                                                ,sep = " ")
                          )
                        )
                      )
  )
  
}

#' @title Contact
#' @description Adds a button to be able to contact TPL
#' @export
contact <- function(mailto = "mailto:texaspolicylab@rice.edu") {
  
  htmltools::tags$div(class = "footer_contact"
                      ,htmltools::tags$p(
                        htmltools::tags$a("Contact Us"
                                          ,class = "btn"
                                          ,target = ""
                                          ,href = mailto)
                      )
  )
}

#' @title First row
first_row <- function() {
  
  htmltools::tags$div(class="first-row"
                      ,htmltools::tags$div(class = "g-container"
                                           ,htmltools::tags$div(class = "g-row",
                                                                tpl_logo(),
                                                                copyright(),
                                                                contact()
                                           )
                      )
  )
  
}

#' @title TPL footer
#' @description Creates the TPL footer to add to dashboards and reports
#' @param version the version of the dashboard
#' @export
footer <- function(TPL_URL = "https://www.texaspolicylab.org/") {
  
  htmltools::tags$footer(tpl_star(),
                         first_row()
  )
}
