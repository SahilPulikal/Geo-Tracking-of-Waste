library(shiny)
library(leaflet)
library(ggplot2)

  
ui <- fluidPage(
           mainPanel(
                          mainPanel(tabPanel("",leafletOutput("mymap",width=850,height=560)))
                     
                     
)
)
 
server <- function(input, output, session) {
  
  Dustbin <- read.csv("D:/Software projects/Final year project/project 1/Geo-Tag-waste-management--master/src/R/Dustbin.csv")
  
  LeafTrashIcon <- icons(
    iconUrl = ifelse(Dustbin$Status == "Empty","http://leafletjs.com/examples/custom-icons/leaf-green.png",
                     ifelse(Dustbin$Status == "Full",
                            "http://leafletjs.com/examples/custom-icons/leaf-red.png",
                            "http://leafletjs.com/examples/custom-icons/leaf-orange.png")),
    iconWidth = 20, iconHeight = 50,
    iconAnchorX = 25, iconAnchorY = 50
  )
  
  pal <- colorFactor(
    palette = c("limegreen","red3","darkorange2"),
    domain = as.factor(Dustbin$Status)
    
  )
  
  
  
  output$mymap <- renderLeaflet({
    
    leaflet() %>%
      addTiles() %>%  # Add default OpenStreetMap map tiles
      addMarkers(lng = Dustbin$Longitude, lat = Dustbin$Latitude, 
                 label  = paste(Dustbin$Area,Dustbin$Time_of_Day, sep = " , Time of day: "),
                 icon = LeafTrashIcon,
                 clusterOptions = markerClusterOptions(FreezeAtZoom = 5)) %>%
      addLegend("bottomright", pal = pal, values = Dustbin$Status,
                title = "Dustbin Status", opacity = 1)
  })
  
  output$data <- renderDataTable({
    
    head(Dustbin, n = 200)
    
  })
  
  
  
  }

shinyApp(ui, server)