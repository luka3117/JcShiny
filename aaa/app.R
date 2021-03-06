# widget
# https://shiny.rstudio.com/gallery/widget-gallery.html

# demo
# https://shiny.rstudio.com/gallery/#demos

library(shiny)
ui <- fluidPage(
  sliderInput(
    inputId = "num",
    label = "col:",
    min = 1,
    max = 5,
    value = 30
  ),
  shiny::textInput(inputId = "qq",
                   label = "qqq",
                   value = "ss"),
  sliderInput(
    inputId = "bin",
    label = "Number of bins:",
    min = 1,
    max = 5,
    value = 30
  )
  ,
  plotOutput("res")
)

server <- function(input, output) {
   output$res<- renderPlot({
     plot(iris[,input$num])
   })
}

# Run the application 
shinyApp(ui = ui, server = server)