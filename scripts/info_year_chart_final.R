library("dplyr")
library("plotly")
library("stringr")

# Filters the historical eSports given dataframe and modify it.
# Return a bar plot using values from the data frame. The X values are
# the Year and Y values are the number of eSports tournaments, games,
# and players held that year.
get_info_year_chart <- function(df, years) {

  # Filter DF by categories
  filtered_df <- filter_categories(df, years)

  # Create bar plot
  info_year_chart <- plot_ly(
    data = filtered_df,
    x = ~year,
    y = ~Tournaments,
    name = "Tournaments",
    type = "bar",
    hoverinfo = "text",
    hovertext = paste("Year:", filtered_df$year,
                      "<br>Tournaments:", filtered_df$Tournaments)
    ) %>%
    add_trace(
      y = ~Players,
      name = "Players",
      hoverinfo = "text",
      hovertext = paste("Year:", filtered_df$year,
                        "<br>Players:", filtered_df$Players)
    ) %>%
    add_trace(
      y = ~Games,
      name = "Active eSport Games",
      hoverinfo = "text",
      hovertext = paste("Year:", filtered_df$year,
                        "<br>Games:", filtered_df$Games)
    ) %>%
    layout(
      title = "Count of eSports Tournaments, Players, and Games Per Year",
      xaxis = list(title = "Year"),
      yaxis = list(title = "Count")
    )

  return(info_year_chart)
}

# Filters given DF by the given years. Group by years then summmarize by
# number of tournaments, players, and games.
filter_categories <- function(df, years) {
  filtered_df <- df %>%
    mutate(year = str_sub(Date, -4, -1)) %>%
    filter(year %in% !!years) %>%
    group_by(year) %>%
    summarize(Tournaments = sum(Tournaments),
              Players = sum(Players),
              Games = n_distinct(Game))
}
