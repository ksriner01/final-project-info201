library("dplyr")
library("plotly")
library("stringr")
library("ggplot2")
library("scales")

# Takes in the historical eSports data frame and outputs a modified data frame
# that calculates the total sum of eSports tournament earnings for Dota 2
# across the years.
# Creates a scatter plot using the values from the dota_2 data frame. The
# X values are the year and the Y values are the tournament earnings that year.
get_top_3_chart <- function(df, years_to_plot) {

  dota_2 <- df %>%
    filter(Game == "Dota 2") %>%
    mutate(year = str_sub(Date, -4, -1)) %>%
    filter(year >= years_to_plot[1]) %>%
    filter(year <= years_to_plot[2]) %>%
    group_by(year) %>%
    summarize(game = "Dota 2",
              yearly_earnings = sum(Earnings))

  counter_strike <- df %>%
    filter(Game == "Counter-Strike: Global Offensive") %>%
    mutate(year = str_sub(Date, -4, -1)) %>%
    filter(year >= years_to_plot[1]) %>%
    filter(year <= years_to_plot[2]) %>%
    group_by(year) %>%
    summarize(game = "Counter-Strike: Global Offensive",
              yearly_earnings = sum(Earnings))

  leauge_of_legends <- df %>%
    filter(Game == "League of Legends") %>%
    mutate(year = str_sub(Date, -4, -1)) %>%
    filter(year >= years_to_plot[1]) %>%
    filter(year <= years_to_plot[2]) %>%
    group_by(year) %>%
    summarize(game = "League of Legends",
              yearly_earnings = sum(Earnings))

  top_games_df <- bind_rows(dota_2, counter_strike, leauge_of_legends)

  top_games_chart <- ggplot(data = top_games_df,
                            mapping = aes(x = year, y = yearly_earnings,
                                          group = game, color = game,
                                          text = paste("\nGame:", game,
                                                       "\nYear:", year,
                                                       "\nEarnings:",
                                                       dollar(yearly_earnings)
                                                       ))) +
    geom_line() +
    geom_point() +
    ggtitle("Yearly Tournament Earnings of Three High-Income Games") +
    xlab("Year") +
    ylab("Earnings") +
    theme(axis.text.x = element_text(angle = 45))

  ggplotly(top_games_chart, tooltip = "text")
}
