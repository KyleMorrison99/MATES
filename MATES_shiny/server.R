#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(shinydashboard)

# Define server logic
server <- function(input, output, session) {
  # Define download handlers
  output$downloadMATES <- downloadHandler(
    filename = function() {
      "MATES_Checklist_english.pdf"
    },
    content = function(file) {
      file.copy("MATES_Analysis/MATES_shiny/MATES_checklist.pdf", file)
    }
  )
  
  output$downloadPRISMA <- downloadHandler(
    filename = function() {
      "PRISMA_Statement.pdf"
    },
    content = function(file) {
      file.copy("www/PRISMA_Statement.pdf", file)
    },
    contentType = "application/pdf"
  )
  
  output$downloadGUIDE <- downloadHandler(
    filename = function() {
      "Explanation_and_Elaboration.pdf"
    },
    content = function(file) {
      file.copy("www/Explanation_and_Elaboration.pdf", file)
    },
    contentType = "application/pdf"
  )
  
  # Define dynamic study link rendering
  output$study_link <- renderUI({
    req(input$study_selector)
    tags$a(href = input$study_selector, "Access the selected study", target = "_blank")
  })
}
