setwd("C:/Users/claire.GMFMC/Desktop/WFH files/R (2)/R/EFHwGit/EFHApp")

RSland<-read.csv("Red Snapper Landings 1986-2015.csv",na.strings = "NA")
#RDland<-RDland[c(-65,-66),]

library(highcharter)
library(htmlwidgets)

hc <- highchart() %>% 
  
  #hc_add_serie(name=speciesName, type="line", data=List.Results)
  
  hc_xAxis(categories =RSland$Year) %>% 
  hc_add_series(name = "Recreational", data = RSland$Rec_Harvest, type="line") %>% 
  hc_add_series(name = "Commercial", data = RSland$Comm_Harvest, type="line") %>%
  
  hc_yAxis(title = list(text = "Landings (MP ww)"),
           labels = list(style = list(color = "#000000", fontWeight="bold"))) %>% 
  hc_xAxis(title = list(text = "Year"),
           labels = list(style = list(color = "#000000", fontWeight="bold"))) %>% 
  hc_add_theme(hc_theme_economist()) %>% 
  hc_exporting(enabled = TRUE,
                filename = "AgeLength") 
saveWidget(hc,"RSland.html")


setwd("X:/Claire/text/EFHspeciesLandings")
a <- read.csv("CommercialLandingsNoShrimp.csv",na.strings="0")
a2 <- a[,-32]

for (i in 2:3){
  landYear <- a2$YEARLAND
  comm_Harvest <- a2[,i]
  
  speciesName <- names(a2)[i]
  speciesName2 <- names(a2)[i]
   # speciesName <- a2[1,i]
   # speciesName2 <- a2[1,i]
  
  speciesName2 <- highchart() %>% 
    
    #hc_add_serie(name=speciesName, type="line", data=List.Results)
    
    hc_xAxis(categories =landYear) %>% 
    #hc_add_series(name = "Recreational", data = RSland$Rec_Harvest, type="line") %>% 
    hc_add_series(name = "Commercial", data = comm_Harvest, type="line") %>%
    
    hc_yAxis(title = list(text = "Landings (MP ww)"),
             labels = list(style = list(color = "#000000", fontWeight="bold"))) %>% 
    hc_xAxis(title = list(text = "Year"),
             labels = list(style = list(color = "#000000", fontWeight="bold"))) %>% 
    hc_add_theme(hc_theme_economist()) %>% 
    hc_exporting(enabled = TRUE,
                 filename = "AgeLength") 
  saveWidget(speciesName2,paste(speciesName,".html",sep=""),selfcontained=TRUE)
}
