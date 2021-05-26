library(shiny)
library(leaflet)
library(ggplot2)

  
ui <- fluidPage(

                
                mainPanel(h2("Geo tracking of Waste"), align = "center",
                          tabsetPanel(type = "pills",
                                      tabPanel("Dustbin Map",leafletOutput("mymap",width=1000,height=400)),
                                      
                                      tabPanel("Data Analysis I",plotOutput("ggplot1",width=1000,height=400),textOutput("summary1")),
                                      tabPanel("Data Analysis II",plotOutput("ggplot2",width=1000,height=400),textOutput("summary2")),
                                      tabPanel("Data Analysis III",plotOutput("ggplot3",width=1000,height=400),textOutput("summary3")))
                          
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
  
  output$ggplot1 <- renderPlot({
    
    
    
    val <- c("limegreen","red3","darkorange2")
    lab <- c("Empty","Full","Half")
    ggplot(Dustbin, aes(x = factor(Area), fill = factor(Status))) + geom_bar(position = "stack") +
      scale_x_discrete("Area Name") + scale_y_continuous("Status Proportion") +
      scale_fill_manual("Status", values = val, labels = lab)
    
  })
  
  output$ggplot2 <- renderPlot({
    
    val_time <- c("maroon1","maroon2","maroon3","maroon4")
    lab_time <- c("7-10 am","11am-3pm","3-7 pm","7pm-12am")
    
    ggplot(Dustbin, aes(x = factor(Status), fill = factor(Time_of_Day))) + geom_bar(position = "stack") +
      scale_x_discrete("Dustbin Status") + scale_y_continuous("Dustbin Status count") +
      scale_fill_manual("Time of Day", values = val_time, labels = lab_time)
    
    
  })
  
  output$ggplot3 <- renderPlot({
    
    val <- c("limegreen","red3","darkorange2")
    lab <- c("Empty","Full","Half")
    
    ggplot(Dustbin, aes(x = Population, fill = factor(Status))) + geom_bar(position = "stack") +
      scale_x_discrete("Increasing Area Population") + scale_y_continuous("Status count") +
      scale_fill_manual("Status", values = val, labels = lab)
  })
  
  
  
}

shinyApp(ui, server)