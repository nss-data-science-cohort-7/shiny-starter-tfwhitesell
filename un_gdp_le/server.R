# Define server logic required to draw a histogram
function(input, output, session) {
    
    output$distPlot <- renderPlot({
        gdp_le |>
            filter(Country == input$country) |> 
            ggplot(aes(x = GDP_Per_Capita)) +
            geom_histogram(bins = input$bins) +
            # scale_x_continuous(limits = c(0, NA)) +
            labs(x = 'GDP Per Capita',
                 title = 'Histogram of GDP Per Capita')
    })
    
}
