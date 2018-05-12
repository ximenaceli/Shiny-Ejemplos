library(shiny)
library(rpivotTable)



nacimientos2015 <- read_delim("nacimientos2015.csv", 
                              ";", escape_double = FALSE, trim_ws = TRUE, locale = locale(encoding = "ISO-8859-1"))



ui = fluidPage(
  h1("Tabla dinámica Nacimientos", align="center"),
  rpivotTableOutput("Tabla")
)

server = function(input, output) {
  output$Tabla <- renderRpivotTable({
    change_locale(rpivotTable(nacimientos2015),
                  'es')
  })
}


shinyApp(ui, server)
