# Load libraries
library(shiny)
library(tidyverse)
library(nflverse)
library(ggrepel)
library(grid)
library(DT)

# get nfl contract data
nfl_contracts <- nflreadr::load_contracts()
nfl_contracts_25 <- nfl_contracts %>% filter(draft_year == "2025")
summary(nfl_contracts)

# filter nfl data
nfl_contracts_25_filtered <- nfl_contracts_25 %>% 
  filter(!is.na(draft_overall)) %>% 
  select("draft_round", "draft_overall", "player", "position", "draft_team", "guaranteed", "value", "college") %>% 
  mutate(percent_guaranteed = guaranteed / value)