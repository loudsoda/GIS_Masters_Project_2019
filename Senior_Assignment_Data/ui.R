#Caleb Ellis
#6/25/2019

#Import Libraries
library(leaflet)
library(shiny)
library(rsconnect)
library(magrittr)

#Set directory
setwd('C:/Users/Caleb/Documents/R_Practice')

#Load distillery .csv
distilleries <-read.csv('directory.csv', stringsAsFactors = FALSE, header = TRUE)

#Load PNG
iconB<- 'Icon.png'

#Set properties of Icons.png
dis_icon<-makeIcon(
  iconUrl= (iconB),
  iconWidth = 60, iconHeight = 75,
  iconAnchorX = 0, iconAnchorY = 0
)

#The UI properties
ui <- bootstrapPage(
  #Names and Labels for top of UI
  fluidRow(
    column(8,
           h2("Bourbon Map"),
           h3("Caleb Ellis Senior Assignment 2019 ", style = "color:DarkRed"))),
  
  
  tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
  
  leafletOutput("map", width = "100%", height = "90%"),
  absolutePanel(top = 10, right = 10,
                
                tags$h3("Click on a distillery to learn more.")
                
  )
)


