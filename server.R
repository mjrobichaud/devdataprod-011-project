library(stats)
data(eurodist)
distances <- as.matrix(eurodist)
default <- "Select a city"
distanceBetween <- function(from_city, to_city) if(from_city != default && to_city != default) { distances[from_city, to_city] }

travelTime <- function(from_city, to_city) if(from_city != default && to_city != default) { distances[from_city, to_city] / 90 } 

shinyServer(
    function(input, output) {
	output$distance <- renderPrint (
            {distanceBetween(input$from_city, input$to_city)}
        )
	output$time <- renderPrint (
	    {travelTime(input$from_city, input$to_city)}
	)
    }
)
