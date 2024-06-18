# app_ui.R

# Load packages
library("shiny")
library("shinythemes")
library("plotly")
library("stringr")

# Overview Page
overview_page <- tabPanel(
    "Overview",
    HTML('<center><img src = "https://worldfootballsummit.com/wp-content/uploads/2022/08/esports.jpeg"></center>'),
    tags$h2(id = "centered", "Overview of Our Project"),
    tags$em(id = "centered_block",
            "Kyle Riner, Roger Tram, Danhiel Vu, Sydney Wood"),
    hr(),
    tags$p(
      id = "intro",
      "Many young adults have grown up with video games and as the eSports scene
      has blown up recently, a career in playing video games competitively has
      never been more achievable. Our project's goal is to determine how
      electronic sports (eSports) have grown and changed over the years as well
      as the growing viability of eSports as a potential career. We used data on
      eSports consisting of monthly earnings, total players, and amount of
      eSports tournament from kaggle.com which sources data from
      EsportsEarnings.com. We will identify the trends that
      appear within the data sets and visualize them in plots in order to find
      the answers to our questions.",
    ),
    tags$h2(id = "centered", "Sources of Our Data"),
    tags$ul(
      id = "centered",
      tags$a("Kaggle.com | ", href =
            "https://www.kaggle.com/rankirsh/esports-earnings"),
      tags$a("EsportsEarnings.com", href =
            "https://www.esportsearnings.com/history")
    )
)

# First interactive page
chart_one_page <- tabPanel(
    "Summary by Year",
    sidebarLayout(
        sidebarPanel(
            h2("Modify the bar plot:"),
            checkboxGroupInput(
                inputId = "group_years",
                label = h3("Select the years you would like to plot:"),
                choices = seq(1998, 2020),
                selected = seq(1998, 2020, 2)
            )
        ),
        mainPanel(
            tags$h1(id = "pagetitle", "eSports Numbers per Year"),
            plotlyOutput(
                outputId = "earnings_barplot"

            ),
            p("Tip! This plot is interactive. Click on the legend to filter
              certain categories."),
            hr(),
            h2("What Does This Chart Tell Us?"),
            p("A bar plot was used to keep track of the number of
              tournaments, players, and unique games being held for all
              eSport events per year. This is to try and display the growth
              of eSports in the last two decades and to show how fast the
              industry itself is growing.
              This plot, in particular, displays the rise and accumulation of
              eSports popularity. This is important to our research question
              as it shows the eSports industry growing rapidly at a linear
              incline. Utilizing this linear model, eSports shows no signs
              of stagnating and will potentially grow even further
              in the future.")
        )
    )
)

# Second interactive page
chart_two_page <- tabPanel(
    "Tournament Earnings",
    sidebarLayout(
        sidebarPanel(
            h2("Modify the scatter plot:"),
            sliderInput(
                inputId = "years_to_plot",
                label = h3("Select the year range you would like to plot:"),
                min = 2010,
                max = 2020,
                value = c(2012, 2020),
                sep = ""
            )

        ),
        mainPanel(
            tags$h1(id = "pagetitle", "Tournament Earnings"),
            plotlyOutput(
                outputId = "top_3_scatter"
            ),

            p("Tip! This plot is interactive. Click on the legend to remove/add
              certain games. Hover over points to view additional information"),

            hr(),

            h2("Chart Description"),
            p("The question this chart attempts to answer is: how have the
            earnings of popular eSports tournaments changed since their games
            were first released? As you can see, many of these games have
            seen increased yearly earnings since their release date but decline
            dramatically in the year 2020. This dip can be explained by the
            novel coronavirus which has significantly reduced participation in
            many activities, including eSports tournaments. However, it is
            likely that eSports will once again experience a rise in popularity
            and earnings as stay-at-home measures are lifted and people resume
            their regular activities in the future. Therefore, I expect
            tournament earnings in these three games as well as others to
            continue rising after 2021."),

            h3("Why These Specific Games?"),
            p("The three eSports games plotted above are all
            ranked in the top 5 for overall tournament earnings. Each of these
            games was released in 2010 or later and therefore that is the
            earliest year the slider will allow as an input.
            ")
        )
    )
)

# Third interactive page
chart_three_page <- tabPanel(
    "Tournaments per Game",
    sidebarLayout(
        sidebarPanel(
            h2("Modify the pie chart:"),
            radioButtons(
              inputId = "years_list",
              label = h3("Select Year Observed:"),
              choices = seq(1998, 2017),
              selected = 1998
            )
        ),
        mainPanel(
            tags$h1(id = "pagetitle", "# of Tournaments per Game"),
            plotOutput(
                outputId = "popular_games"
            ),
            hr(),
            h2("Pie Chart Explanation"),
            p("The question this chart aimed to answer is what games were being
              played competetively throughout the years. Looking at the data,
              the late 90s and early 2000s had a couple games having many
              more tournaments compared to the rest of the top 15 games of
              their year as opposed to the late 2010s evening out on tournament
              recognition. What this means for aspiring eSports players today
              is that while our other charts show a decrease of earnings in
              2020, the variance in games being played at a professional level
              allow them many options as to what they can play for a career.")
        )
    )
)

# Summary Take away Page
summary_page <- tabPanel(
    "Summary",
    tags$h1(id = "pagetitle", "Summary of our Project"),
    tags$h3(id = "bluetext", "First Takeaway"),
    p("When looking at the ", em("eSports Numbers per Year"), " chart, we see an
      immediate trend: that since 1998, the eSports scene has only grown until
      this year. Each year's numbers are surpassed by the next and 2020 has
      slightly lower numbers than 2019 presumably because of the ongoing COVID
      pandemic. The cycle of eSports is different than that of regular sports
      like football because as new competitive games continue to be released,
      tournaments for those games will also be organized. In the future we can
      expect this trend of growth to continue as long as catastrophic events
      such as COVID don't shut down the world again."),

    tags$h3(id = "bluetext", "Second Takeaway"),
    p("Something that is immediately obvious upon viewing the second chart,
    titled ", em("Yearly Torunament Earnings of Three High-Income Games"),
      ", is the dramatic decline in earnings from 2019 to 2020. Dota 2
      experienced the most significant decrease from $47 million in 2019 to
      less than $8 million the next year in tournament earnings. For competitive
      eSports players, it would probably be best to wait until the effects of
      COVID-19 are resolved before resuming play. In other words, right now is
      not the best time to be entering the realm of eSports because projected
      earnings are no where near as high as usual. Therefore, it would be in
      their best interest for gamers to look elsewhere for additional income
      until at least 2021.
      "),

    tags$h3(id = "bluetext", "Third Takeaway"),
    p("Lastly, while eSports earnings have dropped at this current time, we
      can safely say that the career of an eSports player can be very flexible
      in regards to what games they can play now compared to the past. When
      looking at the ",  em("# of Tournaments per Game"), " chart, the growth
      in number of games being played competetively shown from the 90s to
      2020 is staggering with the top 15 games of this year all having
      similarly high numbers of tournaments. So while venturing
      into eSports in the current day is not a good idea, we know that when
      earnings rise up in future years there'll be many options for an eSports
      player to choose from.")
)

# Navigation Bar
ui <- fluidPage(
  includeCSS("style.css"),

  navbarPage("eSports Project",
             theme = shinytheme("yeti"),
             overview_page,
             chart_one_page,
             chart_two_page,
             chart_three_page,
             summary_page
  )
)
