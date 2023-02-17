library(shiny)
ui <- fluidPage(
  
  # Application title
  titlePanel("Demo app of histogram"),
  
  # Sidebar with a slider input for number of bins 
  sliderInput(inputId = "bins",
              label = "Number of bins:",
              min = 1,
              max = 50,
              value = 30),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("hist")
  )
)


server <- function(input, output) {
  
  output$hist <- renderPlot({
    
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white',
         xlab = 'x',
         main = 'Histogram of waiting')
  })
}

shinyApp(ui = ui, server = server)
