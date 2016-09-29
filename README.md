
<!-- README.md is generated from README.Rmd. Please edit that file -->
geopattern HTML widget
======================

This is an experimental HTML widget that provides support for the [geopattern JavaScript library](https://github.com/btmills/geopattern) as a HTML widget.

The library takes a string, hashes it and then generates a unique image. Check out the [live preview page](https://btmills.github.io/geopattern/) of the JS project to get an example.

Install
-------

``` r
devtools::install_github("dirkschumacher/geopattern")
```

Why should I care?
------------------

First, it is just cool in itself :)

Use it whenever you would like to visually verify a hash of data. For example, you want a quick way in your shiny app to signal the user if the underlying dataset has changed. Simply hash the data.frame and generate an image out of it. See the example below.

### Shiny example

This shiny app displays a unique different, deterministic image whenever the underlying `mtcars` dataset changes.

``` r

library(shiny)
library(geopattern)

server <- function(input, output) {
  
  dataset <- reactive({
    head(mtcars, input$head_table_n)
  })
  
  output$table_pattern <- renderGeopattern({
    geopattern(digest::sha1(dataset()))
  })
  output$carstable <- renderDataTable({
    dataset()
  })
  
}

ui <- fluidPage(
  
  # Application title
  titlePanel("Hash all the data!"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("head_table_n",
                  "Number of bins:",
                  min = 1,
                  max = nrow(mtcars),
                  value = 30),
      geopatternOutput("table_pattern")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      dataTableOutput("carstable")
    )
  )
)

shinyApp(ui = ui, server = server)
```
