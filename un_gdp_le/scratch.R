gdp_le |> 
    ggplot(aes(x = GDP_Per_Capita)) +
    geom_histogram(bins = 30)



output$distPlot <- renderPlot({
    filtered() |> 
        ggplot(aes(x = GDP_Per_Capita)) +
        geom_histogram(bins = input$bins) +
        scale_x_continuous(limits = c(min(gdp_le$GDP_Per_Capita, na.rm = TRUE),
                                      max(gdp_le$GDP_Per_Capita, na.rm = TRUE))) +
        labs(x = 'GDP Per Capita',
             title = 'Histogram of GDP Per Capita')
})

# can't get this to work, object object error on the plot
# Define server logic required to draw a histogram
function(input, output, session) {
    
    filtered <- reactive({
        if (input$country == "All"){
            country_filter <- countries
        } else {
            country_filter <- input$country
        }
        
        gdp_le |>
            filter(country %in% country_filter)
        
    })
    
    output$distPlot <- renderPlot({
        filtered() |> 
            ggplot(aes(x = GDP_Per_Capita)) +
            geom_histogram(bins = input$bins) +
            scale_x_continuous(limits = c(0, NA)) +
            labs(x = 'GDP Per Capita',
                 title = 'Histogram of GDP Per Capita')
    })
    
}
