# Aggregate Table
library(dplyr)
library("scales")

# Function that takes in a data frame and returns a table. Grouping by year was
# the best way to see growth in the eSports scene since we can directly see
# trends as the years go on.
get_table_info <- function(df) {
  df %>%
    group_by("Year" = format(as.Date(Date, format = "%d/%m/%Y"), "%Y")) %>%
    summarize(
      "Total Earnings" = dollar(sum(Earnings, na.rm = TRUE)),
      "Total Players" = sum(Players, na.rm = TRUE),
      "Total Tournaments" = sum(Tournaments, na.rm = TRUE)
    ) %>%
    arrange(Year)
}

# This table shows clearly how eSports has grown in popularity over the years as
# every subsequent year has an increase in earnings, players, and tournaments.
# Higher earnings means more players and more players means more tournaments
# which leads to higher earnings creating a snowball effect that has only been
# slightly halted in 2020 due to COVID-19.
