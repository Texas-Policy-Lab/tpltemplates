#' @title TPL sidebar panel
#' @description Uses the configuration file to automatically create the sidebar panel
#' @inheritParams create_tab_ids
#' @param tab_icons a vector of icon names the same length as the tab_names (default is NULL)
#' @export
sidebar_panel <- function() {

  tab_id_html <- lapply(names(TABS),
                        function(tab) {

    ns <- NS(tab)

    # test_list_item_not_null(TABS[[tab]], "icon")
    # test_list_item_not_null(TABS[[tab]], "menu_title")
    # test_list_item_not_null(TABS[[tab]], "page_title")

    shinydashboard::menuItem(id = ns("menuItem"),
                             tabName = ns("menuItem"),
                             text = TABS[[tab]]$id,
                             icon = shiny::icon(TABS[[tab]]$icon)
                             )
  })

  shinydashboard::dashboardSidebar(
    shinydashboard::sidebarMenu(
      tab_id_html
    )
  )
}

#' @title Main Panel
#' @description Creates basic structure for main panel
#' @inheritParams create_tab_ids
#' @export
main_panel <- function() {
  
  # x <- lapply(tabs, function()
  #   shinydashboard::tabItem(
  #     tabName = tab$id
  #     ,shiny::div(shiny::span(tab$page_title)
  #                 ,class = "page-title")
  #     ,ui_element()
  #   ))
  # 
  shinydashboard::dashboardBody(
    shiny::div(class= "tab-content",
               lapply(names(TABS),
                      function(tab) {

                        ns <- NS(tab)

                        shinydashboard::tabItem(
                          tabName = ns("menuItem")
                        )
                      })
               )
  )
}

#' @title TPL User Inferface
#' @export
ui <- function() {

  shiny::shinyUI(
    shiny::fluidPage(
      lapply(list.files(CSS_PTH, full.names = TRUE), shiny::includeCSS)
      ,shiny::tags$head(
        shiny::tags$link(rel = "shortcut icon"
                         ,type = "image/png"
                         ,href = FAVICON_PTH),
        lapply(list.files(JS_PTH, full.names = TRUE), shiny::includeScript))
      ,shinydashboard::dashboardPage(header = shinydashboard::dashboardHeader(title = DASHBOARD_TITLE),
                                     sidebar = sidebar_panel(),
                                     body = main_panel()
                                     )
      ,footer()
    )
  )
}
