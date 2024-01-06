# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("GDP and Life Expectancy"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 5,
                        max = 100,
                        value = 30),
            
            selectInput("country",
                        label = "Select the desired countries(s):",
                        choices = countries)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
)
