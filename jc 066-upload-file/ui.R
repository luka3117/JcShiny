
ui<-fluidPage(
  titlePanel("Uploading Files"),
  
  sidebarPanel(
    fileInput('file1', 'csv data を選択',
              accept = c('text/csv'))
  ),
  mainPanel(
    tableOutput('contents'),
    textOutput('res')
  )
  
)

server<-function(input, output) {
  output$contents <-renderTable({
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    # read.csv(inFile$datapath, header = T)
    read.csv(inFile$datapath, header = T)
  })
}


output$res<-shiny::renderText({
  inFile <- input$file1
  
  if (is.null(inFile))
    return(NULL)
  # aa<-read.csv(inFile$datapath, header = T)
  inFile$name %>% read.csv() %>% summary()
  
})


shinyApp(ui = ui, server = server)