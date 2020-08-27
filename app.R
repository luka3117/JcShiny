# widget
# https://shiny.rstudio.com/gallery/widget-gallery.html

# demo
# https://shiny.rstudio.com/gallery/#demos

library(shiny)
ui <- fluidPage(
  sliderInput(
    inputId = "num",
    label = "iris data変数col 番号:",
    min = 1,
    max = 5,
    value = 3
  ),
  shiny::textInput(inputId = "aaa", 
                   # label = c("a", "b"),
                   label = "name",
                   value = "b"),
  sliderInput(
    inputId = "bin",
    label = "Number of bins:",
    min = 1,
    max = 5,
    value = 30
  )
  ,
  plotOutput("iris.plot")
)

server <- function(input, output) {
  output$iris.plot <- renderPlot({
    plot(iris[,input$num])
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
