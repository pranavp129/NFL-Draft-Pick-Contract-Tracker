library(shiny)
library(tidyverse)
library(nflverse)
library(ggrepel)
library(grid)
library(DT)

ui <- fluidPage(
  titlePanel("2025 NFL Draft Pick Contract Tracker"),
  
  fluidRow(
    column(12,
           actionButton("toggleSidebar", "Toggle Filters", 
                        class = "btn-primary btn-sm",
                        style = "margin-bottom: 10px;")
    )
  ),
  
  conditionalPanel(
    condition = "input.toggleSidebar % 2 == 0",  # Show when odd number of clicks
    wellPanel(
      fluidRow(
        column(6,
               selectInput("position", "Position:",
                           choices = unique(nfl_contracts_25_filtered$position),
                           selected = unique(nfl_contracts_25_filtered$position),
                           multiple = TRUE)
        ),
        column(6,
               checkboxGroupInput("draft_round", "Draft Rounds:",
                                  choices = 1:7,
                                  selected = 1:7,
                                  inline = TRUE)
        )
      )
    )
  ),
  
  DT::dataTableOutput("myTable")
)