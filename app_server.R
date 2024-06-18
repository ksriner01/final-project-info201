# app_server.R

# Load packages
library("shiny")
library("plotly")
library("leaflet")
library("ggplot2")

# Source files
source("scripts/info_year_chart_final.R")
source("scripts/dota_2_chart_final.R")
source("scripts/earnings_pie_chart_final.R")

# Load DF File
esports_df <- read.csv("data/HistoricalEsportData.csv",
                       stringsAsFactors = FALSE)

# Server side
server <- function(input, output) {
    output$earnings_barplot <- renderPlotly({
      get_info_year_chart(esports_df, input$group_years)
    })
    output$top_3_scatter <- renderPlotly({
      get_top_3_chart(esports_df, input$years_to_plot)
    })
    output$popular_games <- renderPlot({
      get_earnings_pie_chart(esports_df, input$years_list)
    })
}
