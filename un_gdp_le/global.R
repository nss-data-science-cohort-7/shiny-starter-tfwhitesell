library(shiny)
library(tidyverse)

gdp_le <- read_csv("data/gdp_le.csv")

countries <- gdp_le |> 
    pull(Country) |> 
    unique() |> 
    sort()

countries <- c("All", countries)

years <- gdp_le |> 
    pull(Year) |> 
    unique() |> 
    sort()

years <- c("All", years)