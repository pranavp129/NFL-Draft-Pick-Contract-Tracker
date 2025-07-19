# https://pranavpitchala.shinyapps.io/2025-Draft-Contract-Tracker/

# NFL Rookie Contracts Analysis - Shiny App

A Shiny web application for analyzing and visualizing NFL rookie contract data, built with a three-file structure for better organization and maintainability.

## Project Structure

This Shiny app follows the recommended multi-file structure:

```
nfl-rookie-contracts/
├── global.R          # Data loading and global variables
├── server.R          # Server-side logic and reactive functions
├── ui.R             # User interface definition
```

## Files Overview

### `global.R`
- **Purpose**: Loads and preprocesses NFL rookie contract data
- **Contents**: 
  - Data import and cleaning functions
  - Global variables and constants
  - Package loading
  - Data transformation and preparation
- **Important**: This file is automatically sourced when the app starts and makes data available to both `server.R` and `ui.R`

### `server.R`
- **Purpose**: Contains the server-side logic
- **Contents**:
  - Reactive functions for data filtering and analysis
  - Output rendering (plots, tables, summaries)
  - Event handlers for user interactions
  - Logic for contract calculations

### `ui.R`
- **Purpose**: Defines the user interface
- **Contents**:
  - Layout and styling
  - Input controls (filters, selectors, etc.)
  - Output placeholders
  - UI components for displaying results

## Running the Application

## Features

This app provides analysis and visualization of NFL rookie contracts including:
- Contract value analysis by position, draft round, and team
- Interactive filtering and data exploration

## Data Source

The data is sourced from **Over The Cap** using the [`nflverse`](https://nflverse.nflverse.com/) package.

## Technical Notes

- The three-file structure improves code organization and maintainability
- `global.R` is automatically sourced before `server.R` and `ui.R`
- Objects created in `global.R` are available in the global environment for both server and UI
- Always run the complete app rather than sourcing individual files to ensure proper initialization
