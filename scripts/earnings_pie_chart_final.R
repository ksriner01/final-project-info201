library("dplyr")
library("plotly")
library("stringr")
library("ggplot2")

# Takes in the historical eSports data frame and outputs a modified data frame
# that sums up the top 15 eSports games in terms of earnings in the year 2020.
# Creates a pie chart using the values from the 2020 earnings dataframe.
get_earnings_pie_chart <- function(df, yr) {

  earnings_2020 <- df %>%
    mutate(year = format(as.Date(df$Date, format="%m/%d/%Y"),"%Y")) %>%
    filter(year == yr) %>%
    group_by(Game) %>%
    summarize(total_tournaments = sum(Tournaments)) %>%
    arrange(total_tournaments) %>%
    top_n(n = 15)

  earnings_plot <- ggplot(earnings_2020, aes(x = "", y = total_tournaments,
                                             fill = Game)) +
    geom_bar(stat = "identity", width = 1) +
    coord_polar("y", start = 0) +
    ggtitle("2020 Top 15 Earnings by Game") +
    theme_minimal()

  return(earnings_plot, tooltip = "text")
}
