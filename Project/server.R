##Source:  https://www.census.gov/hhes/www/cpstables/032014/hfootnotes.htm
##(1) The 2003 CPS asked respondents to choose one or more races. White Alone refers to people who reported White and did not report any other race category. The use of this single-race population does not imply that it is the preferred method of presenting or analyzing data. The Census Bureau uses a variety of approaches. Information on people who reported more than one race, such as "White and American Indian and Alaska Native" or "Asian and Black or African American," is available from Census 2010 through American Factfinder. About 2.9 percent of people reported more than one race in 2010.
##(2) Black alone refers to people who reported Black and did not report any other race category.
##(3) Asian alone refers to people who reported Asian and did not report any other race category.
##(4) The "Outside metropolitan statistical areas" category includes both micropolitan statistical areas and territory outside of metropolitan and micropolitan statistical areas. For more information, see "About Metropolitan and Micropolitan Statistical Areas" at [www.census.gov/population/metro]

library(shiny)

incData <- read.csv("data/2013HHCharIncome.csv", check.names = FALSE, strip.white = TRUE, stringsAsFactors = FALSE)
xLabels <- colnames(incData[5:(ncol(incData) - 2)])
y1Labels <- incData[,1]
y2Labels <- incData[,2]

shinyServer(
     function(input, output) {
          output$categories <- renderUI({
               selectInput("selCategory", "Choose a category:", choices = as.character(incData[,1]))
          })
          
          output$characteristics <- renderUI({
               y2List <- as.character(incData[incData$Category == input$selCategory,2])
               selectInput("selCharac", "Choose a characteristic:", choices = y2List)
          })
          
          output$ySlider <- renderUI({
               
               if(!input$yAxisBhv) {
                    sliderInput("yRange", "Set Y-Axis Limit:", min = 0, max = 8000, step = 100, value = 8000)
               }
          })
          
          output$t <- renderPlot({
               if(input$yAxisBhv) {
                    yScale <- 8000
               } else {
                    yScale <- input$yRange
               }
               
               if(!is.null(yScale)) {
                    choiceMod <- paste0("^", input$selCharac, "$")               
                    pullRow <- grep(choiceMod, y2Labels)
                    x <- as.numeric(incData[pullRow,5:(ncol(incData) - 2)])
                    par(mar = c(12.1, 5.1, 4.1, 2.1))
                    barplot(x, las = 2, space = 0, ylim = c(0, yScale), names.arg = xLabels, xpd = FALSE, 
                            col = "lightyellow2", main = paste0(input$selCategory, " - ", input$selCharac))
                    par(new = TRUE)
                    plot(x = 0, type = "n", xlim = c(5000,200000), ylim = c(0,yScale), xaxt = 'n', yaxt = 'n', xlab = '', ylab = '', xpd = FALSE)
                    mtext("Household Income (US$)", 1, line = 10)
                    mtext("Number of Households (1000s)", 2, line = 4)
                    
                    if(input$userVal < 5000 & !is.na(input$userVal)) {
                         inpt <- 5000
                    } else if (input$userVal > 200000 & !is.na(input$userVal)) {
                         inpt <- 200000
                    } else {
                         inpt <- input$userVal
                    }
                    
                    abline(v = inpt, col = "red")
                    text(inpt, (yScale * .70), paste0("MARKER - $", as.character(input$userVal)), pos = 4, col = "red", srt = 90, cex = .90)
                    
                    chcMean <- as.numeric(incData[pullRow, ncol(incData) - 1])
                    chcMedian <- as.numeric(incData[pullRow, ncol(incData)])
                    
                    if("View Mean" %in% input$addLines) {
                         abline(v = chcMean, col = "blue")                         
                         text(chcMean, (yScale * .70), paste0("MEAN - $", as.character(chcMean)), pos = 4, col = "blue", srt = 90, cex = .90)
                    }
                    
                    if("View Median" %in% input$addLines) {
                         abline(v = chcMedian, col = "purple")
                         text(chcMedian, (yScale * .70), paste0("MEDIAN - $", as.character(chcMedian)), pos = 4, col = "purple", srt = 90, cex = .90)
                    }
               }
          })
     }
)
