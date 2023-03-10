library(shiny)
library(shinydashboard)
library(ggplot2)
library(ggthemes)
library(dplyr)
library(tidyr)
library(magrittr)
theme_set(theme_minimal())
ui <- dashboardPage(
  
  dashboardHeader(title = "Analysis on Iris Dataset"),
  
  
  dashboardSidebar(
    
    sidebarMenu(
      menuItem("correlation", tabName = "correlation", icon = icon("dashboard")),
      menuItem("species", tabName = "species", icon = icon("dashboard")),
      menuItem("barplot", tabName = "barplot", icon = icon("dashboard"))
    )
    
  ),
  
  
  dashboardBody(
    
    tabItems(
      
      tabItem("correlation", 
              box(plotOutput("corr.plot"), width = 8, solidHeader = TRUE, status = "primary"), 
              box(selectInput(inputId = "selection", label = "selection: ", 
                              choices = c("Sepal.Width", "Petal.Length", "Petal.Width")), width = 4,
                  collapsible = TRUE, status = "primary")),
      
      tabItem("species",
              box(plotOutput("plot.1"), width = 8, solidHeader = TRUE, status = "primary"),
              box(selectInput(inputId = "feature", label = "features: ", 
                              choices = c("Sepal.Width", "Petal.Length", "Petal.Width")), width = 4,
                  collapsible = TRUE, status = "primary")),
      
      tabItem("barplot",
              box(plotOutput("plot.2"), width = 8, solidHeader = TRUE, status = "primary"),
              box(selectInput(inputId = "select", label = "features: ", 
                              choices = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")), 
                  width = 4, solidHeader = TRUE, status = "primary"))
      
    )
  ))


server <- function(input, output) {
  
  
  output$corr.plot <- renderPlot({
    plot(iris$Sepal.Length, iris[[input$selection]], xlab = "sepal length", ylab = "selection", 
         main = "Correlation plot between variables")
  })
  
  
  output$plot.1 <- renderPlot({ 
    ggplot(iris, aes(Sepal.Length, iris[[input$feature]], col = Species))+
      geom_point(aes(shape = Species))+
      ggtitle("Correlation as per species")+
      ylab("feature")+
      xlab("sepal length")
  })
  
  
  
  output$plot.2 <- renderPlot({
    ggplot(iris, aes(Species, iris[[input$select]]))+
      geom_bar(stat = "identity", fill = "steelblue")+
      ggtitle("Analysis by species")+
      ylab("selection")+
      xlab("species")
    
  })
  
  
  
  
}


shinyApp(ui, server)