library("dplyr")
library("lintr")
library("plotly")
library("stringr")

# Creates a function that takes in the historical eSports data frame and outputs
# a modified data frame that counts up the number of eSports tournaments held
# that year in descending order.
# Creates a bar plot using values from the ordered data frame. The X values are
# the Year and Y values are the number of eSports tournaments held that year.
get_top_games_chart <- function(df) {

    ordered <- df %>%
        mutate(year = str_sub(Date, -4, -1)) %>%
        group_by(year) %>%
        summarize(num_tournaments = sum(Tournaments)) %>%
        arrange(-num_tournaments)

    top_games_plot <- ggplot(ordered, aes(x = year,
                                          y = num_tournaments)) +
        geom_bar(stat = "identity") +
        ggtitle("Number of eSports Tournaments by Year") +
        xlab("Year") +
        ylab("# of Tournaments") +
        theme(axis.text.x = element_text(angle = 90))

    return(top_games_plot)
}
