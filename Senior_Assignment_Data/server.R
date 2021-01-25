#Caleb Ellis
#6/25/2019

#Import Libraries
library(leaflet)
library(shiny)
library(rsconnect)
library(magrittr)

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


server <- function(input, output,session) {

  #Render the markers
  output$map <- renderLeaflet({
    l<- leaflet(data = distilleries)%>% 
      addTiles() %>%
      
      #addProviderTiles(providers$Stamen.Toner) %>%
      addProviderTiles(providers$Esri.WorldStreetMap) %>%
      
      addMiniMap(toggleDisplay = T)%>%
      
      addMarkers(~long, ~lat,
                 
                 group = "marker",
            
                 #Makes Clusters
                 clusterOptions = markerClusterOptions(removeOutsideVisibleBounds = F),
                 
                 icon = dis_icon,
                 
                 #Properties for the popup window
                 popup = paste("Distillery: ",distilleries$Brand,"<br>",
                               "Address:", distilleries$Address,",",distilleries$City, distilleries$State,"<br>",
                               "Year of Production ", distilleries$year,"<br>",
                               "Website: ", distilleries$Website))
    
    
  })
  
}  

