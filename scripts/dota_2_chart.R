library("dplyr")
library("lintr")
library("plotly")
library("stringr")

# Takes in the historical eSports data frame and outputs a modified data frame
# that calculates the total sum of eSports tournament earnings for Dota 2
# across the years.
# Creates a scatter plot using the values from the dota_2 data frame. The
# X values are the year and the Y values are the tournament earnings that year.
get_dota_2_chart <- function(df) {

  dota_2 <- df %>%
    filter(Game == "Dota 2") %>%
    mutate(year = str_sub(Date, -4, -1)) %>%
    group_by(year) %>%
    summarize(yearly_earnings = sum(Earnings))

  dota_2_chart <-
    ggplot(data = dota_2, mapping = aes(x = year, y = yearly_earnings)) +
    geom_point() +
    ggtitle("Dota 2 Tournament Earnings 2011-2020") +
    xlab("Year") +
    ylab("Earnings")

  return(dota_2_chart)
}
