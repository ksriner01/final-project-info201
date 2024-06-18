# app.R

# Load 'Shiny' package
library("shiny")

# Load ui and server
source("app_ui.R")
source("app_server.R")

# Start Shiny with ui from app_ui.R and server from app_server.R
shinyApp(ui = ui, server = server)
