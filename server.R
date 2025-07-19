library(shiny)
library(tidyverse)
library(nflverse)
library(ggrepel)
library(grid)
library(DT)

# Define server logic
function(input, output) {
  
  # Initialize toggle state
  toggleState <- reactiveVal(1)  # Start with filters visible
  
  # Handle toggle button
  observeEvent(input$toggleSidebar, {
    toggleState(toggleState() + 1)
  })
  
  # Reactive data based on user inputs
  filtered_data <- reactive({
    nfl_contracts_25_filtered %>%
      filter(
        position %in% input$position,
        draft_round %in% input$draft_round  # Changed from range to %in% for checkbox
      ) %>%
      arrange(draft_overall) %>%  # Sort by draft pick order
      select(
        "Round" = draft_round,
        "Pick" = draft_overall,
        "Player" = player,
        "Position" = position,
        "Team" = draft_team,
        "College" = college,
        "Total Value" = value,
        "Guaranteed" = guaranteed,
        "% Guaranteed" = percent_guaranteed
      )
  })
  
  # Render the table with highlighting
  output$myTable <- DT::renderDataTable({
    data <- filtered_data() %>%
      mutate(
        `Total Value` = `Total Value` * 1000000,  # Convert millions to actual dollars
        `Guaranteed` = `Guaranteed` * 1000000     # Convert millions to actual dollars
      )
    
    DT::datatable(
      data,
      options = list(
        pageLength = -1,  # Show all rows, no pagination
        dom = 'ft',  # 'f' adds search box, 't' shows table
        order = list(list(1, 'asc'))  # Default sort by Pick column (index 1, 0-based)
      ),
      rownames = FALSE
    ) %>%
      DT::formatCurrency(c("Total Value", "Guaranteed"), currency = "$", digits = 0) %>%
      DT::formatPercentage("% Guaranteed", digits = 1) %>%
      DT::formatStyle(
        columns = 1:ncol(data),
        target = 'row',
        backgroundColor = DT::styleEqual(0, "#ffcccc"),  # Light red for 0% guaranteed
        valueColumns = "% Guaranteed"
      )
  }, server = FALSE)
  
}