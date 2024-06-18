# Summary Information
library("scales")

# Function that returns a summary of 5 different values from our data set
get_summary_info <- function(dataframe) {
  info <- list()
  info$avg_earnings <- dollar(mean(dataframe[["Earnings"]], na.rm = TRUE))
  info$total_earnings <- dollar(sum(dataframe[["Earnings"]], na.rm = TRUE))
  info$max_earnings <- dollar(max(dataframe[["Earnings"]], na.rm = TRUE))
  info$max_players <- max(dataframe[["Players"]], na.rm = TRUE)
  info$max_tournaments <- max(dataframe[["Tournaments"]], na.rm = TRUE)
  return(info)
}
